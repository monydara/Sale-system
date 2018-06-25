Ext.define('App.controller.fixAsset.Transfer', {
	extend: 'Ext.app.Controller',
	views:[
		'fixAsset.transferFixAsset.Index',
		'fixAsset.transferFixAsset.FrmTransfer'

	],	
	stores:[
		'item.Item',
		'combo.Item',
		'combo.Location',
		'fixAsset.TransferFixAsset',
		'fixAsset.TransferFixAssetDetail',
		'combo.UM',
		'combo.ItemFixedAsset',
	],
	init: function() {
		
	    this.control({
	    	'transferFixAssetIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'transferFixAssetIndex textfield[name=Search]':{
	    		change: this.search
	    	},


	    	'transferFixAssetIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    
	    	'FormTransfer button[action=Save]':{
	    		click: this.save
	    	},
	    	'FormTransfer button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	 'FormTransfer button[action=AddItem]':{
	    	 	click: this.addRow
	    	},
	    	'FormTransfer grid':{
	    		edit: this.setRecord
	    		//beforeedit: this.checkDoublicate,
	    	}
	    	

	    });
	},

	itemRecord: {},
	umRecord: {},
	storeDetailTmp: Ext.create('App.store.fixAsset.TransferFixAssetDetail'),

	search:function(field){
		var store = this.getFixAssetTransferFixAssetStore();
		var params={
			search_string:field.getValue()
		};

		Util.loadStoreSearch(store, params);

		
	},
	
	
	add:function(btn){
		var conatiner = btn.up('transferFixAssetIndex');
		var form = conatiner.down('FormTransfer');
		form.getForm().reset(true);
		this.getFixAssetTransferFixAssetDetailStore().removeAll();
		conatiner.setActiveItem(form);

	},
	edit: function(btn){

		var conatiner = btn.up('transferFixAssetIndex');
		var form = conatiner.down('FormTransfer');
		var record = Util.getRecord(btn);
		
		form.getForm().reset(true);
		form.loadRecord(record);
		this.getFixAssetTransferFixAssetDetailStore().load({
			params: {
				transfer_stock_id: record.get('id')
			}
		});
		conatiner.setActiveItem(form);
	},



save: function(btn) {

		var form = btn.up('form').getForm(),
			frm = btn.up('form'),
			me = this,
			values = form.getValues(),
			record = form.getRecord(),
			store = me.getFixAssetTransferFixAssetStore();

		if (form.isValid()) {



			if (record) {
				// get delete record from tmp store and add to the real store for submit to server
				var storeFixassetTransfer = me.getFixAssetTransferFixAssetDetailStore();
				me.storeDetailTmp.each(function(rec) {
					storeFixassetTransfer.add(rec);
				});

				// reset value 
				me.storeDetailTmp.removeAll();

				values["transfer_stock_detail_attributes"] = Util.getItemStore(me.getFixAssetTransferFixAssetDetailStore());


				record.set(values);
			} else {
				var model = Ext.create('App.model.TransferFixAsset');
				values["transfer_stock_detail_attributes"] = Util.getItemStore(me.getFixAssetTransferFixAssetDetailStore());
				model.set(values);
				store.add(model);
			};

			Ext.MessageBox.wait("Pleae wiat sytem processing.........", "Saving Data")
			store.sync({
				success: function() {
					Ext.MessageBox.hide();
					me.cancel(btn);
					store.load();

				},
				failure: function(batch ,option) {
					Ext.MessageBox.hide();
					var msg = option.batch.proxy.reader.rawData.message;
					Ext.MessageBox.show({
						title: 'Error',
						msg: msg,
						icon: Ext.MessageBox.ERROR,
						buttons: Ext.Msg.OK
					});
					store.load();
				},
				scope:this
			});


		} else {

			Util.msg('Please entry require field');
		}


	},


	cancel:function(btn){
		var conatiner = btn.up('transferFixAssetIndex');
		var grid = conatiner.down('grid[name=index]');		
		conatiner.setActiveItem(grid);
	},
	addRow: function(btn){
		var store = btn.up('grid').getStore();
		var model = Ext.create("App.model.TransferFixAssetDetail");
		store.add(model);
	},		
	setRecord: function(editor, e) {

		var grid = e.grid,
			me = this;
		var record = grid.getStore().getAt(e.rowIdx);
		switch (e.colIdx) {

			case 1:
				getRecordComboSetToGrid(editor, e, me, record);
				break;
			case 2:
				getRecordComboSetToGrid(editor, e, me, record);
				break;
			case 3:
			 	checkDoublicate(editor, e, me, record);
				
				break;
			case 4:
				filterUm(editor, e, me, record);
				break;

			default:

		}
		// ============== additional function
		function filterUm(editor, e, me, record){
			var rec = me.umRecord.data;
			record.set("um_id", rec.id);

		}
		function checkDoublicate(editor, e, me, record){
			
			var store = grid.getStore();
			var count = 0; 
			store.each(function(rec){
				if (rec.get("serial_no") == record.get("serial_no")) {
					count++;
				};
			});

			if (count>1) {
				 alert('duplicate serial no');
				 record.set("serial_no","" );
			};
		}

		function getRecordComboSetToGrid(editor, e, me, record) {

			var values = me.itemRecord.data; //get record form grid/combobox 

			// e.grid.getView().refresh();
			record.set("item_id", values.id);
			record.set("qty", 1);
			record.set("item_name", values.name);
			
			record.set("barcode", values.barcode);
			record.set("serial_no", values.serial_no);
			record.set("um_id", values.um_id);
			record.set("um", values.um);
			// if (!(record.get('transfer_stock_id') > 0)) {
			// 	record.set('transfer_stock_id' , null)
			// };
			me.itemRecord = false;
		}
	},
})

