Ext.define('App.controller.fixAsset.Depreciation', {
	extend: 'Ext.app.Controller',
	views:[
		'fixAsset.depreciation.Index',
		'fixAsset.depreciation.FrmDepreciation'

	],	
	stores:[
		'sale.Customer'
	],
	init: function() {
		
	    this.control({
	    	'depreciationIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'FormDepreciation button[action=Edit]':{
	    		click: this.edit
	    	},
	    	// 'FormTransfer textfield[name=Search]':{
	    	// 	change: this.search
	    	// },
	    
	    	// 'FormTransfer button[action=Save]':{
	    	// 	click: this.save
	    	// },
	    	'FormDepreciation button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	

	    });
	},
	search:function(field){
		var store = this.getSaleCustomerStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},
	

	add:function(btn){
		var conatiner = btn.up('depreciationIndex');
		var form = conatiner.down('FormDepreciation');
		form.getForm().reset(true);
		conatiner.setActiveItem(form);

	},
	edit: function(btn){

		var conatiner = btn.up('FormTransfer');
		var form = conatiner.down('FormTransfer');
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
  		store = me.getSaleCustomerStore();	
  			    	          				    	          		
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
		var conatiner = btn.up('depreciationIndex');
		var grid = conatiner.down('grid[name=index]');		
		conatiner.setActiveItem(grid);
	}



})

