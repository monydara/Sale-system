
Ext.define('App.controller.item.Brand', {
	extend: 'Ext.app.Controller',
	views:[
		'item.brand.Index',
		'item.brand.Frm',
	],	
	stores:[
		'item.Brand',
		
	],
	init: function() {
		
	    this.control({
	    	'brandIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'brandIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'brandIndex textfield[name=Search]':{
	    		change: this.search
	    	},
	    
	    	'frmBrand button[action=Save]':{
	    		click: this.save
	    	},
	    	'frmBrand button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	

	    });
	},
	search:function(field){
		var store = this.getItemBrandStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},
	

	add:function(btn){
		var win = Ext.create('App.view.item.brand.Frm');
		win.show();
		win.center();
		win.down('textfield[name=name]').focus(true, 300);

	},
	edit: function(btn){

		
		var record = Util.getRecord(btn);
		
		if (record) {			
			var win = Ext.create('App.view.item.brand.Frm');
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
  		store = me.getItemBrandStore();
  			    	          				    	          		
  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Brand');
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