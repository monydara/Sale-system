Ext.define('App.controller.sale.CustomPrice', {
	extend: 'Ext.app.Controller',
	views:[
		'sale.customPrice.Index',
		'sale.customPrice.Fm',
	],
	stores:[
		//"combo.Customer",
		//"combo.Lead",
		'combo.Status',
		'sale.CustomPrice',
		//'combo.Contact',
		'combo.ItemPrice',
		'combo.Item',
		"sale.CustomPriceDetail",
		'combo.UM'
		//'combo.SaleRepresentative',
		//'combo.Source',
		//'combo.OpportunityStatus',

	],
	init: function() {

	    this.control({
	    	'customPriceIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'customPriceIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'customPriceIndex textfield[name=Search]':{
	    		change: this.search
	    	},

	    	'FormCustomPrice button[action=Save]':{
	    		click: this.save
	    	},
	    	'FormCustomPrice button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	"FormCustomPrice combo[name=contact_id]":{
	    		select: this.selectContact
	    	},
	    	"FormCustomPrice button[action=AddContact]":{
	    		click: this.addContact
	    	},
	    	"FormCustomPrice button[action=AddItemDetail]":{
	    		click: this.addItemDetail
	    	},
	    	"FormCustomPrice combo[name=oppunity_to]":{
	    		change: this.showAndHideCustomer
	    	},
			"FormCustomPrice grid":{
				beforeedit: this.filterItemPrice,
				edit: this.setPriceToItem
			}


	    });
	},
    umRecord:{} ,
    itemRecord:{},
    setPriceToItem:function (editor , e) {
        var grid = e.grid,
            me = this;
        var record = grid.getStore().getAt(e.rowIdx);

        switch (e.colIdx) {

            case 1:
                me.imSetPriceToItemDetail(me,record);
                break;
			case 2 :
				me.imSetUmNameAndPriceToItem(me , record)
				break;
        }

    },
    imSetUmNameAndPriceToItem:function (me, record) {
       	var itemPrice = me.umRecord;

        record.set('price' , itemPrice.get('price'))
        record.set('um_id' , itemPrice.get('um_id'));
        record.set('um_name' , itemPrice.get('um'))
    },
	imSetPriceToItemDetail:function (me , record) {

		var item = me.itemRecord;
		record.set('item_id' , item.get('id'));
        record.set('price' , item.get('price'))
		record.set('um_id' , item.get('um_id'));
        record.set('um_name' , item.get('um'))
    },
	filterItemPrice: function(editor, e) {
		var grid = e.grid,
			me = this;
		var record = grid.getStore().getAt(e.rowIdx);

		switch (e.colIdx) {

			case 2:
				// before select item price must be filter price
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
	deleteDetailRecord:function(grid , rec ){
		var me = this;
		Ext.MessageBox.confirm('Confirm', 'Are you sure to remove this item ?', function(btn) {
			if (btn == 'yes') {
				var store = grid.getStore();
				if (rec.get('id') > 0) {
					rec.set("_destroy", true);
					store.filterBy(function(record){

					   return record.get('_destroy' ) == true ? false :true ;
					});
				}else {
					store.remove(rec);
				}

			}
		});

	},

	showAndHideCustomer:function(combo , value){
		var form = combo.up("form");
		if (value == "Customer") {
			form.down("combo[name=lead_id]").hide();
			form.down("combo[name=customer_id]").show();
		}else{

			form.down("combo[name=lead_id]").show();
			form.down("combo[name=customer_id]").hide();

		};



	},
	addItemDetail:function(btn){

		var model = Ext.create("App.model.CustomPriceDetail");
		var store = btn.up("grid").getStore();
		store.add(model);
	},
	addContact:function(){
		App.app.getController("sale.Contact").add();
	},
	selectContact:function(combo , records){
		var rec = records[0];
		var frm = combo.up("form");

		frm.getForm().setValues(rec.data);
	},
	search:function(field){
		var store = this.getSaleLeadStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},


	add:function(btn){
		var conatiner = btn.up('customPriceIndex');
		var form = conatiner.down('FormCustomPrice');
		this.getSaleCustomPriceDetailStore().removeAll();

		form.getForm().reset(true);
		conatiner.setActiveItem(form);

	},
	edit: function(btn){

		var conatiner = btn.up('customPriceIndex');
		var form = conatiner.down('FormCustomPrice');
		var record = Util.getRecord(btn);
		this.getSaleCustomPriceDetailStore().load({
			params:{
				custom_price_id : record.get("id")
			}
		})
		if (record) {
			form.getForm().reset(true);
			form.loadRecord(record);
			form.getForm().setValues(	record.data.contact);
			conatiner.setActiveItem(form);
		};

	},

	save :function(btn){

		var form = btn.up('form').getForm(),
		frm = btn.up('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSaleCustomPriceStore();

  		if(form.isValid() ){
  			values["custom_price_detail_attributes"] =Util.getItemStore(me.getSaleCustomPriceDetailStore());
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.CustomPrice');
  				model.set(values);
  				store.add(model);
  			};

	  		me.storeSync(store, me , btn );

  		}else{
  			Util.msg('Please entry require field');
  		}


	},
	storeSync:function(store, me , btn ){
		var recs = store.getModifiedRecords();
		if (recs.length > 0) {

			Ext.MessageBox.wait("Please System Proccessing Data.....", "Please Wait")
		};
		store.sync({
				success: function() {
					Ext.MessageBox.hide();
					me.cancel(btn);
					store.load();
				},
				failure: function(batch, option) {
					Ext.MessageBox.hide();
	            store.rejectChanges();

					var msg = option.batch.proxy.reader.rawData.message;
					Ext.MessageBox.show({
						title: 'Error',
						msg: msg,
						icon: Ext.MessageBox.ERROR,
						buttons: Ext.Msg.OK
					});

				},
				scope: this
			});
	},

	validateContactnLeadOwner:function(form ,values){

		if (!(values.contact_id > 0) ) {
			form.down("combo[name=contact_id]").setValue("");
			return false ;
		};

		if (!(values.leadOppunity_owner > 0) ) {
			form.down("combo[name=leadOppunity_owner]").setValue("");
			return false ;
		};

		return true ;

	},
	cancel:function(btn){
		var conatiner = btn.up('customPriceIndex');
		var grid = conatiner.down('grid[name=index]');
		conatiner.setActiveItem(grid);
	}
})
