
Ext.define('App.controller.setup.Menu', {
	extend: 'Ext.app.Controller',
	views:[
		'setup.menu.Index',
		'setup.menu.Frm',

	],
	stores:[
		'setup.Menu',
		'combo.Menu',

	],
	init: function() {

	    this.control({
	    	'menuIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'menuIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'menuIndex textfield[name=Search]':{
	    		change: this.search
	    	},

	    	'frmMenu button[action=Save]':{
	    		click: this.save
	    	},
	    	'frmMenu button[action=Cancel]':{
	    		click: this.cancel
	    	},


	    });
	},
	search:function(field){
		var store = this.getSetupMenuStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},


	add:function(btn){
		var win = Ext.create('App.view.setup.menu.Frm');
		win.show();
		win.center();
		win.down('textfield[name=menu]').focus(true, 300);

	},
	edit: function(btn){


		var record = Util.getRecord(btn);

		if (record) {
			var win = Ext.create('App.view.setup.menu.Frm');
			win.show();
			win.center();
			win.down('form').getForm().loadRecord(record);
			win.down('textfield[name=menu]').focus(true, 300);
			

		};

	},

	save :function(btn){

		var form = btn.up('window').down('form').getForm(),
		frm = btn.up('window').down('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSetupMenuStore();
			console.log("values " , values );

  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Menu');
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
