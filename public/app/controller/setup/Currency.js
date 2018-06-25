
Ext.define('App.controller.setup.Currency', {
	extend: 'Ext.app.Controller',
	views:[
		'setup.currency.Index',
		'setup.currency.Frm',

	],
	stores:[
		'setup.Currency',
		'combo.Currency',

	],
	init: function() {

	    this.control({
	    	'currencyIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'currencyIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'currencyIndex textfield[name=Search]':{
	    		change: this.search
	    	},

	    	'frmCurrency button[action=Save]':{
	    		click: this.save
	    	},
	    	'frmCurrency button[action=Cancel]':{
	    		click: this.cancel
	    	},


	    });
	},
	search:function(field){
		var store = this.getSetupCurrencyStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},


	add:function(btn){
		var win = Ext.create('App.view.setup.currency.Frm');
		win.show();
		win.center();
		win.down('textfield[name=name]').focus(true, 300);

	},
	edit: function(btn){


		var record = Util.getRecord(btn);

		if (record) {
			var win = Ext.create('App.view.setup.currency.Frm');
			win.show();
			win.center();
			win.down('form').getForm().loadRecord(record);
			win.down('textfield[name=name]').focus(true, 300);

		};

	},

	save :function(btn){

		var form = btn.up('window').down('form').getForm(),
		frm = btn.up('window').down('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSetupCurrencyStore();

  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Currency');
  				model.set(values);
  				store.add(model);
  			};
  			store.sync();
  			me.cancel(btn);

  		}else{
  			Util.msg('Please entry require field');
  		}


	},
	cancel:function(btn){
		var win = btn.up('window');
		win.close();
	}



})
