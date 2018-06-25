
Ext.define('App.controller.item.Location', {
	extend: 'Ext.app.Controller',
	views:[
		'item.location.Index',
		'item.location.FmLocation',
	],	
	stores:[
		'item.Location',
	],
	init: function() {
		
	    this.control({
	    	'locationIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'locationIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'locationIndex textfield[name=Search]':{
	    		change: this.search
	    	},
	    
	    	'FormLocation button[action=Save]':{
	    		click: this.save
	    	},
	    	'FormLocation button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	

	    });
	},
	search:function(field){
		var store = this.getItemLocationStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},

	add:function(btn){
		var win = Ext.create('App.view.item.location.FmLocation');
		win.show();
		win.center();
		win.down('textfield[name=name]').focus(true,300);
	},

	edit: function(btn){
		var record = Util.getRecord(btn);
		if(record){
			var win = Ext.create('App.view.item.location.FmLocation');
			win.show();
			win.center();
			win.down('form').getForm().loadRecord(record);
			win.down('textfield[name=name]').focus(true,300);
		};
	},

	save :function(btn){

		var form = btn.up('window').down('form').getForm(),
		frm = btn.up('window').down('form'),
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getItemLocationStore();	
  			    	          				    	          		
  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Location');
  				model.set(values);
  				store.add(model);
  			};
  			// store.sync();
  			// me.cancel(btn);

  			Ext.MessageBox.wait("Pleae wiat sytem processing.........", "Saving Data")
			store.sync({
				success: function() {
					me.cancel(btn);
					store.load();
					Ext.MessageBox.hide();
					
				},
				failure: function() {
					store.rejectChanges();
					Ext.MessageBox.hide();

					var msg = batch.proxy.reader.rawData.message;
					Ext.MessageBox.show({
						title: 'Error',
						msg: msg,
						icon: Ext.MessageBox.ERROR,
						buttons: Ext.Msg.OK
					});
				},
				scope:this
			});

  		}else{
  			Util.msg('Please entry require field');
  		}
		

	},

	cancel:function(btn){
		var win = btn.up('window');
		win.close();
	}
})