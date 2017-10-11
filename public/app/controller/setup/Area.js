
Ext.define('App.controller.setup.Area', {
	extend: 'Ext.app.Controller',
	views:[
		'setup.area.Index',
		'setup.area.Frm',

	],	
	stores:[
		'setup.Area', 
		
	],
	init: function() {
		
	    this.control({
	    	'areaIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'areaIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'areaIndex textfield[name=Search]':{
	    		change: this.search
	    	},
	    
	    	'frmArea button[action=Save]':{
	    		click: this.save
	    	},
	    	'frmArea button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	

	    });
	},
	search:function(field){
		var store = this.getSetupAreaStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},
	

	add:function(btn){
		var win = Ext.create('App.view.setup.area.Frm');
		win.show();
		win.center();
		win.down('textfield[name=code]').focus(true, 300);

	},
	edit: function(btn){

		
		var record = Util.getRecord(btn);
		
		if (record) {			
			var win = Ext.create('App.view.setup.area.Frm');
			win.show();
			win.center();			
			win.down('form').getForm().loadRecord(record);
			win.down('textfield[name=code]').focus(true, 300);

		};
		
	},

	save :function(btn){

		var form = btn.up('window').down('form').getForm(),
		frm = btn.up('window').down('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSetupAreaStore();	
  			    	          				    	          		
  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Area');
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