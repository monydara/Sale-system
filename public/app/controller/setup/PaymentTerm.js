
Ext.define('App.controller.setup.PaymentTerm', {
	extend: 'Ext.app.Controller',
	views:[
		'setup.paymentTerm.Index',
		'setup.paymentTerm.Frm',

	],
	stores:[
      'setup.PaymentTerm',
		'combo.PaymentTerm',

	],
	init: function() {

	    this.control({
	    	'paymentTermIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'paymentTermIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'paymentTermIndex textfield[name=Search]':{
	    		change: this.search
	    	},

	    	'frmPaymentTerm button[action=Save]':{
	    		click: this.save
	    	},
	    	'frmPaymentTerm button[action=Cancel]':{
	    		click: this.cancel
	    	},


	    });
	},
	search:function(field){
		var store = this.getSetupPaymentTermStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},


	add:function(btn){
		var win = Ext.create('App.view.setup.paymentTerm.Frm');
		win.show();
		win.center();
		win.down('textfield').focus(true, 300);

	},
	edit: function(btn){


		var record = Util.getRecord(btn);

		if (record) {
			var win = Ext.create('App.view.setup.paymentTerm.Frm');
			win.show();
			win.center();
			win.down('form').getForm().loadRecord(record);
			win.down('textfield').focus(true, 300);

		};

	},

	save :function(btn){
      var win = btn.up('window');
		var form = win.down('form').getForm(),
		frm = win.down('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSetupPaymentTermStore();

  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.PaymentTerm');
  				model.set(values);
  				store.add(model);
  			};

         Util.storeSync(store, win);

  			// store.sync();
  			// me.cancel(btn);

  		}else{
  			Util.msg('Please entry require field');
  		}


	},
	cancel:function(btn){
		var win = btn.up('window');
		win.close();
	}



})
