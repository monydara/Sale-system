Ext.define('App.controller.service.Maintenance', {
	extend: 'Ext.app.Controller',
	views: [
		'service.maintenance.Index',
		'service.maintenance.FmMaintenance',
		
	],
	stores: [
		'service.Maintenance',
		'service.MaintenanceDetail',

		'combo.Customer',
		'combo.Item',
		'combo.ItemPrice',
	],
	init: function() {

		this.control({
			'maintenanceIndex button[action=Add]': {
				click: this.add
			},
			'maintenanceIndex button[action=Edit]': {
				click: this.edit
			},
			'maintenanceIndex textfield[name=Search]': {
				change: this.search
			},
			// 'maintenanceIndex button[action=Terminate]': {
			// 	click: this.terminateMaintenance
			// },

			'FormMaintenance button[action=Save]': {
				click: this.save
			},
			'FormMaintenance button[action=Cancel]': {
				click: this.cancel
			},

			// Add new row to grid
			'FormMaintenance button[action=AddItem]': {
				click: this.addRow
			},

			'FormMaintenance grid': {
				edit: this.setRecord,
				beforeedit: this.filterItemPrice
			}

		});
	},

	itemRecord: {},
	umRecord: {},
	storeDetailTmp: Ext.create('App.store.service.MaintenanceDetail'),

	setRecord: function(editor, e) {
		var grid = e.grid;
		var me = this;
		var record = grid.getStore().getAt(e.rowIdx);
		switch (e.colIdx) {
			case 1:
				getRecordComboSetToGrid(editor, e, me, record);
				break;
			case 3:
				getTotalQty(editor, e, me, record);
				break;
			case 4:
				setExtendPriceValue(editor, e, me, record);
				break;
			case 5:
				setExtendPriceValue(editor, e, me, record);
				break;
			default:
		}

		function setExtendPriceValue(editor, e, me, record) {
			record.set("extend_price", record.get("price") * record.get("qty"));
			record.set("total_qty", record.get("multiplier") * record.get("qty"));

			me.setGrandTotal(e.grid);
		}

		function getTotalQty(editor, e, me, record) {
			var rec = me.umRecord;
			if (me.umRecord.data) {

				record.set("multiplier", rec.get("multiplier"));
				record.set("total_qty", rec.get("multiplier") * record.get("qty"));
				record.set("um_id", rec.get("um_id"));
				record.set("um", rec.get("um"));

				me.umRecord = false;
			};
		}

		function getRecordComboSetToGrid(editor, e, me, record) {

			var values = me.itemRecord.data; //get record form grid/combobox 
			if (values) {

				// e.grid.getView().refresh();
				record.set("item_id", values.id);
				record.set("item_name", values.name);
				record.set("barcode", values.barcode);
				record.set("total_qty", 1);
				record.set("qty", 0);
				record.set("extend_price", 0);
				record.set("price", 0);
				record.set("um_id", values.um_id);
				record.set("um", values.um);
				record.set("multiplier", 1);

				me.itemRecord = false;
				me.setGrandTotal(e.grid);
			};
		}
	},
	
	filterItemPrice: function(editor, e) {
		var grid = e.grid,
			me = this;
		var record = grid.getStore().getAt(e.rowIdx);

		switch (e.colIdx) {
			case 3:
				if (record.get("item_id") > 0) {
					me.getComboItemPriceStore().load({
						params: {
							item_id: record.get("item_id")
						}
					});

				};
				break;
		}
	},

	setGrandTotal: function(grid){
		var grandTotal = 0;
		grid.getStore().each(function(rec) {
			grandTotal += rec.get("extend_price") * 1;
		});

		var form = grid.up("form");
		form.down("displayfield[name=amount_display]").setValue(grandTotal.toFixed(2));
		form.down("hiddenfield[name=amount]").setValue(grandTotal);
	},

	terminateMaintenance: function(btn) {
		var conatiner = btn.up('maintenanceIndex');
		var form = conatiner.down('FormMaintenance');
		var record = Util.getRecord(btn), me = this;
		console.log(record);
		if(record) {
			Ext.MessageBox.confirm('Confirm', 'Are you sure to Cancel this Quotation?', function(btn) {
				if (btn == 'yes') {
					record.set("status", 0);
					me.getServiceMaintenanceStore().sync();
					Ext.MessageBox.show({
						title: 'Terminated',
						msg: 'Terminate is Successfully!',
						icon: Ext.MessageBox.INFO,
						buttons: Ext.Msg.OK
					});
				}
			});
		};
	},

	addRow: function(btn) {
		var store = btn.up('grid').getStore();
		var model = Ext.create('App.model.MaintenanceDetail');
		model.set("maintenance_id", null);
		store.add(model);
	},

	search: function(field) {
		var store = this.getServiceMaintenanceStore();
		var params = {
			search_string: field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},

	add: function(btn) {
		var conatiner = btn.up('maintenanceIndex');
		var form = conatiner.down('FormMaintenance'),
			me = this;
		form.getForm().reset(true);
		this.getServiceMaintenanceDetailStore().removeAll();
		conatiner.setActiveItem(form);
	},

	edit: function(btn) {
		var conatiner = btn.up('maintenanceIndex');
		var form = conatiner.down('FormMaintenance');
		var record = Util.getRecord(btn);
		// console.log(record);
		if (record) {
			form.getForm().reset(true);
			form.loadRecord(record);
			this.getServiceMaintenanceDetailStore().load({
				params: {
					maintenance_id: record.get('id')
				}
			})
			conatiner.setActiveItem(form);
		}
	},

	save: function(btn) {
		var form = btn.up('form').getForm(),
			frm = btn.up('form'),
			me = this,
			values = form.getValues(),
			record = form.getRecord(),
			store = me.getServiceMaintenanceStore();

		if (form.isValid()) {
			if (record) {
				// get delete record from tmp store and add to the real store for submit to server
				var storeMainatenanceDetail = me.getServiceMaintenanceDetailStore();
				me.storeDetailTmp.each(function(rec) {
					storeMainatenanceDetail.add(rec);
				});

				// reset values
				me.storeDetailTmp.removeAll();
				values["maintenance_detail_attributes"] = Util.getItemStore(me.getServiceMaintenanceDetailStore());
				record.set(values);
			} else {
				var model = Ext.create('App.model.Maintenance');
				values["maintenance_detail_attributes"] = Util.getItemStore(me.getServiceMaintenanceDetailStore());
				model.set(values);
				store.add(model);
			};
			store.sync();
			me.cancel(btn);
			store.load();

		} else {
			Util.msg('Please entry require field');
		}
	},

	cancel: function(btn) {
		var conatiner = btn.up('maintenanceIndex');
		var grid = conatiner.down('grid[name=index]');
		this.storeDetailTmp.removeAll();
		conatiner.setActiveItem(grid);
	}
})