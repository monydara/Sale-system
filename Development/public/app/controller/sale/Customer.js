
Ext.define('App.controller.sale.Customer', {
	extend: 'Ext.app.Controller',
	views:[
		'sale.customer.Index',
		'sale.customer.FmCustomer',

	],
	stores:[
		'sale.Customer',
		'combo.Area',
		"combo.Contact",
		"combo.Lead"

	],
	init: function() {

	    this.control({
	    	'customerIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'customerIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'customerIndex textfield[name=Search]':{
	    		change: this.search
	    	},

	    	'FormCustomer button[action=Save]':{
	    		click: this.save
	    	},
	    	'FormCustomer button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	"FormCustomer combo[name=contact_id]":{
	    		select: this.selectContact
	    	},
	    	"FormCustomer button[action=AddContact]":{
	    		click: this.addContact
	    	},
	    	"FormCustomer combo[name=lead_id]":{
	    		select: this.selectLead
	    	},

	    });
	},
	selectLead:function(combo , records){
		var rec = records[0];
		var form = combo.up("form");
		console.log(rec);
		form.getForm().setValues(rec.data );
		form.getForm().setValues(rec.data.contact);
	},
	selectContact:function(combo , records){
		var rec = records[0];
		var frm = combo.up("form");

		frm.getForm().setValues(rec.data);
	},
	addContact:function(){
		App.app.getController("sale.Contact").add();
	},
	search:function(field){
		var store = this.getSaleCustomerStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},


	add:function(btn){
		var conatiner = btn.up('customerIndex');
		var form = conatiner.down('FormCustomer');
		form.getForm().reset(true);
		conatiner.setActiveItem(form);

	},
	edit: function(btn){

		var conatiner = btn.up('customerIndex');
		var form = conatiner.down('FormCustomer');
		var record = Util.getRecord(btn);

		if (record) {
			form.getForm().reset(true);
			form.loadRecord(record);
			form.getForm().setValues(record.data.contact);
			conatiner.setActiveItem(form);
		};

	},

	save :function(btn){

		var form = btn.up('form').getForm(),
		frm = btn.up('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSaleCustomerStore();

  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Customer');
  				model.set(values);
  				store.add(model);
  			};



			store.sync({
				success: function() {
					Ext.MessageBox.hide();
					me.cancel(btn);
					store.load();
					App.app.getStore("combo.Customer").load() ;

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

  		}else{
  			Util.msg('Please entry require field');
  		}


	},
	cancel:function(btn){
		var conatiner = btn.up('customerIndex');
		var grid = conatiner.down('grid[name=index]');
		conatiner.setActiveItem(grid);
	}
})
