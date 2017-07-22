
Ext.define('App.controller.purchase.Vender', {
	extend: 'Ext.app.Controller',
	views:[
		'purchase.vender.Index',
		'purchase.vender.Frm',

	],	
	stores:[
		'purchase.Vender',
	],
	init: function() {
		
	    this.control({
	    	'venderIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'venderIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'venderIndex textfield[name=Search]':{
	    		change: this.search
	    	},
	    
	    	'venderForm button[action=Save]':{
	    		click: this.save
	    	},
	    	'venderForm button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	

	    });
	},
	search:function(field){
		var store = this.getPurchaseVenderStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},
	

	add:function(btn){
		var conatiner = btn.up('venderIndex');
		var form = conatiner.down('venderForm');
		form.getForm().reset(true);
		conatiner.setActiveItem(form);
		form.down('textfield[name=name]').focus(true, 300);
	},
	edit: function(btn){

		var conatiner = btn.up('venderIndex');
		var form = conatiner.down('venderForm');
		var record = Util.getRecord(btn);
		
		if (record) {			
			form.getForm().reset(true);
			form.loadRecord(record);

			conatiner.setActiveItem(form);
		};
		
	},

	save :function(btn){

		var form = btn.up('form').getForm(),
		frm = btn.up('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getPurchaseVenderStore();	
  			    	          				    	          		
  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Customer');
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
		var conatiner = btn.up('venderIndex');
		var grid = conatiner.down('grid[name=index]');		
		conatiner.setActiveItem(grid);
	}



})