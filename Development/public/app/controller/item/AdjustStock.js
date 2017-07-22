
Ext.define('App.controller.item.AdjustStock', {
	extend: 'Ext.app.Controller',
	views:[
		'item.adjuststock.Index',
		'item.adjuststock.FmAdjustStock',
	],	
	stores:[
		'item.AdjustStock',
		'item.AdjustStockDetail',

		'combo.Location',
		'combo.Item',
		'combo.AdjustStockType',
		'combo.ItemPrice',
	],
	init: function() {
		
	    this.control({
	    	'adjuststockIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'adjuststockIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'adjuststockIndex textfield[name=Search]':{
	    		change: this.search
	    	},
	    
	    	'FormAdjustStock button[action=Save]':{
	    		click: this.save
	    	},
	    	'FormAdjustStock button[action=Cancel]':{
	    		click: this.cancel
	    	},

	    	// Add new row to grid
	    	'FormAdjustStock button[action=AddItem]':{
	    		click: this.addRow
	    	},

	    	'FormAdjustStock grid' :{
	    		edit: this.setRecord,
	    		beforeedit: this.filterItemPrice
	    	}

	    });
	},

	itemRecord: {},
	umRecord: {},
	adjustTypeRecord: {},
	storeDetailTmp: Ext.create('App.store.item.AdjustStockDetail'),

	setRecord:function(editor, e){
		var grid = e.grid;
		me = this;
		var record = grid.getStore().getAt(e.rowIdx);
		switch(e.colIdx) {
			case 1:
				getRecordComboSetToGrid(editor, e, me, record);
				break;
			case 4:
				getTotalQty(editor, e, me, record);
				break;
			case 5:
				setValueQty(editor, e, me, record);
				break;
			case 6:
				setValueQty(editor, e, me, record);
				break;
			case 8: 
				setAdjustType(editor, e, me, record);
				break;
			default:
		}

		function setAdjustType(editor, e, me, record){
			var values = me.adjustTypeRecord.data;
			record.set("adjust_type_id", values.id);
			record.set("adjust_type_name", values.name);
			me.itemRecord = false;
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

		function setValueQty(editor, e, me, record){
			record.set("qty" ,record.get("real_qty") - record.get("system_qty"));
		}

		function getRecordComboSetToGrid(editor, e, me, record) {

			var values = me.itemRecord.data; //get record form grid/combobox 
			// e.grid.getView().refresh();
			record.set("item_id", values.id);
			record.set("item_name", values.name);
			record.set("serial_no", values.serial_no);
			record.set("cost", 0);
			record.set("system_qty", 0);
			record.set("real_qty", 0);
			record.set("qty", 0);
			record.set("total_qty", 1);
			record.set("um_id", values.um_id);
			record.set("um", values.um);
			record.set("multiplier", 1);
			// record.set("adjust_type_id", values.id);
			// record.set("adjust_type_name", values.name);

			me.itemRecord = false;
		}
	},

	filterItemPrice: function(editor, e) {
		var grid = e.grid,
			me = this;
		var record = grid.getStore().getAt(e.rowIdx);

		switch (e.colIdx) {
			case 4:
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

	addRow:function(btn){
		var store = btn.up('grid').getStore();
		var model = Ext.create('App.model.AdjustStockDetail');
		model.set("adjust_stock_id", null);
		store.add(model);
	},

	search:function(field){
		var store = this.getItemAdjustStockStore();
		var params={
			search_string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},

	add:function(btn){
		var conatiner = btn.up('adjuststockIndex');
		var form = conatiner.down('FormAdjustStock'),
			me = this;
		form.getForm().reset(true);
		this.getItemAdjustStockDetailStore().removeAll();
		conatiner.setActiveItem(form);
	},

	edit: function(btn){
		var conatiner = btn.up('adjuststockIndex');
		var form = conatiner.down('FormAdjustStock');
		var record = Util.getRecord(btn);
		if(record){
			form.getForm().reset(true);
			form.loadRecord(record);
			this.getItemAdjustStockDetailStore().load({
				params: {
					adjust_stock_id: record.get('id')
				}
			})
			conatiner.setActiveItem(form);
		}
	},

	save :function(btn){
		var form = btn.up('form').getForm(),
		frm = btn.up('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getItemAdjustStockStore();	

  		if(form.isValid()){
  			if (record) {
  				var storeAdjustStockDetail = me.getItemAdjustStockDetailStore();
  				me.storeDetailTmp.each(function(rec){
  					storeAdjustStockDetail.add(rec);
  				})

  				me.storeDetailTmp.removeAll();
  				values["adjust_stock_detail_attributes"] = Util.getItemStore(me.getItemAdjustStockDetailStore());
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.AdjustStock');
  				values["adjust_stock_detail_attributes"] = Util.getItemStore(me.getItemAdjustStockDetailStore());
  				model.set(values);
  				store.add(model);
  			};
  			store.sync();
  			me.cancel(btn);
  			store.load();

  		}else{
  			Util.msg('Please entry require field');
  		}
	},

	cancel:function(btn){
		var conatiner = btn.up('adjuststockIndex');
		var grid = conatiner.down('grid[name=index]');	
		this.storeDetailTmp.removeAll();	
		conatiner.setActiveItem(grid);
	}
})