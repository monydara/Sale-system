
Ext.define('App.controller.item.UM', {
	extend: 'Ext.app.Controller',
	views:[
		'item.um.Index',
		'item.um.FmUM',
	],	
	stores:[
		'item.UM',
	],
	init: function() {
		
	    this.control({
	    	'umIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'umIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'umIndex textfield[name=Search]':{
	    		change: this.search
	    	},
	    
	    	'FormUM button[action=Save]':{
	    		click: this.save
	    	},
	    	'FormUM button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	

	    });
	},
	search:function(field){
		var store = this.getItemUMStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},

	add:function(btn){
		var win = Ext.create('App.view.item.um.FmUM');
		win.show();
		win.center();
		win.down('textfield[name=code]').focus(true,300);
	},

	edit: function(btn){
		var record = Util.getRecord(btn);
		if(record){
			var win = Ext.create('App.view.item.um.FmUM');
			win.show();
			win.center();
			win.down('form').getForm().loadRecord(record);
			win.down('textfield[name=code]').focus(true,300);
		};
	},

	save :function(btn){

		var form = btn.up('window').down('form').getForm(),
		frm = btn.up('window').down('form'),
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getItemUMStore();	
  			    	          				    	          		
  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.UM');
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
				failure: function(batch, option) {
					store.rejectChanges();
					Ext.MessageBox.hide();

					var msg = option.batch.proxy.reader.rawData.message;
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