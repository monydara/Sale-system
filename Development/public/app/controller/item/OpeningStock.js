Ext.define('App.controller.item.OpeningStock', {
	extend: 'Ext.app.Controller',
	views: [
		'item.openingstock.Index',
		'item.openingstock.FmOpeningStock',
	],
	stores: [
		'item.OpeningStock',
		'item.OpeningStockDetail',

		'combo.Location',
		'combo.Item',
		'combo.ItemPrice',
	],
	init: function() {

		this.control({
			'openingstockIndex button[action=Add]': {
				click: this.add
			},
			'openingstockIndex button[action=Edit]': {
				click: this.edit
			},
			'openingstockIndex textfield[name=Search]': {
				change: this.search
			},

			'FormOpeningStock button[action=Save]': {
				click: this.save
			},
			'FormOpeningStock button[action=Cancel]': {
				click: this.cancel
			},

			// Add new row to grid
			'FormOpeningStock button[action=AddItem]': {
				click: this.addRow
			},

			'FormOpeningStock grid': {
				edit: this.setRecord,
				beforeedit: this.filterItemPrice
			}

		});
	},

	itemRecord: {},
	umRecord: {},
	storeDetailTmp: Ext.create('App.store.item.OpeningStockDetail'),

	setRecord: function(editor, e) {
		var grid = e.grid;
		var me = this;
		var record = grid.getStore().getAt(e.rowIdx);
		switch (e.colIdx) {
			case 1:
				getRecordComboSetToGrid(editor, e, me, record);
				break;
			case 2:
				getRecordComboSetToGrid(editor, e, me, record);
				break;
			case 5:
				getTotalQty(editor, e, me, record);
				break;
			default:
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
				record.set("serial_no", values.serial_no);
				record.set("qty", 0);
				record.set("total_qty", 1);
				record.set("cost", 0);
				record.set("um_id", values.um_id);
				record.set("um", values.um);
				record.set("multiplier", 1);

				me.itemRecord = false;
			};
		}
	},
	filterItemPrice: function(editor, e) {
		var grid = e.grid,
			me = this;
		var record = grid.getStore().getAt(e.rowIdx);

		switch (e.colIdx) {
			case 5:
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

	addRow: function(btn) {
		var store = btn.up('grid').getStore();
		var model = Ext.create('App.model.OpeningStockDetail');
		model.set("opening_stock_id", null);
		store.add(model);
	},

	search: function(field) {
		var store = this.getItemOpeningStockStore();
		var params = {
			search_string: field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},

	add: function(btn) {
		var conatiner = btn.up('openingstockIndex');
		var form = conatiner.down('FormOpeningStock'),
			me = this;
		form.getForm().reset(true);
		this.getItemOpeningStockDetailStore().removeAll();
		conatiner.setActiveItem(form);
	},

	edit: function(btn) {
		var conatiner = btn.up('openingstockIndex');
		var form = conatiner.down('FormOpeningStock');
		var record = Util.getRecord(btn);
		console.log(record);
		if (record) {
			form.getForm().reset(true);
			form.loadRecord(record);
			this.getItemOpeningStockDetailStore().load({
				params: {
					opening_stock_id: record.get('id')
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
			store = me.getItemOpeningStockStore();

		if (form.isValid()) {
			if (record) {
				// get delete record from tmp store and add to the real store for submit to server
				var storeOpeningStockDetail = me.getItemOpeningStockDetailStore();
				me.storeDetailTmp.each(function(rec) {
					storeOpeningStockDetail.add(rec);
				});

				// reset values
				me.storeDetailTmp.removeAll();
				values["opening_stock_detail_attributes"] = Util.getItemStore(me.getItemOpeningStockDetailStore());
				record.set(values);
			} else {
				var model = Ext.create('App.model.OpeningStock');
				values["opening_stock_detail_attributes"] = Util.getItemStore(me.getItemOpeningStockDetailStore());
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
		var conatiner = btn.up('openingstockIndex');
		var grid = conatiner.down('grid[name=index]');
		this.storeDetailTmp.removeAll();
		conatiner.setActiveItem(grid);
	}
})