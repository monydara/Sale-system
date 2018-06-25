
Ext.define('App.controller.sale.Contact', {
	extend: 'Ext.app.Controller',
	views:[
		'sale.contact.Index',
		'sale.contact.Frm',

	],
	stores:[
		'sale.Contact',

	],
	init: function() {

	    this.control({
	    	'contactIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'contactIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'contactIndex textfield[name=Search]':{
	    		change: this.search
	    	},

	    	'frmContact button[action=Save]':{
	    		click: this.save
	    	},
	    	'frmContact button[action=Cancel]':{
	    		click: this.cancel
	    	},


	    });
	},
	search:function(field){
		var store = this.getSaleContactStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},


	add:function(btn){
		var win = Ext.create('App.view.sale.contact.Frm');
		win.show();
		win.center();
		win.down('textfield[name=contact_name]').focus(true, 300);

	},
	edit: function(btn){


		var record = Util.getRecord(btn);

		if (record) {
			var win = Ext.create('App.view.sale.contact.Frm');
			win.show();
			win.center();
			win.down('form').getForm().loadRecord(record);
			win.down('textfield[name=contact_name]').focus(true, 300);

		};

	},

	save :function(btn){

		var form = btn.up('window').down('form').getForm(),
		frm = btn.up('window').down('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSaleContactStore();

  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Contact');
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
