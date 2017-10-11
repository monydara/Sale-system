
Ext.define('App.controller.sale.Lead', {
	extend: 'Ext.app.Controller',
	views:[
		'sale.lead.Index',
		'sale.lead.FmLead',
		'sale.lead.FmLeadInfomation',
		'sale.lead.FmLeadDirectSale'

	],
	stores:[
		'sale.Lead',
		'sale.LeadWebsite',
		'sale.LeadDirectsale',
		'sale.LeadPurpose',
		'sale.LeadInfomation',
		'combo.Area',
		'combo.Contact',
		'combo.LeadStatus',
		"combo.SaleRepresentative",
		"combo.Source",


	],
	init: function() {

	    this.control({
	    	'leadIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'leadIndex button[action=Add_lead_direct_sale]':{
	    		click: this.add_lead_direct_sale
	    	},
	    	'leadIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'leadIndex button[action=Edit_lead_direct_sale]':{
	    		click: this.edit_lead_direct_sale
	    	},
	    	'leadIndex button[action=Edit_website]': {
	    		click: this.edit_website
	    	},
	    	'leadIndex textfield[name=Search]':{
	    		change: this.search
	    	},
	    	'leadIndex textfield[name=Search_website]':{
	    		change: this.search_web_site
	    	},
	    	'leadIndex textfield[name=Search_directsale]':{
	    		change: this.search_direct_sale
	    	},
	    	'leadIndex button[action=advance_search]':{
	    		click: this.clickInfo
	    	},
	    	'leadIndex button[action=Add_lead_infomation]':{
	    		click: this.add_lead_info
	    	},
	    	'leadIndex button[action=Edit_lead_infomation]':{
	    		click: this.edit_lead_info
	    	},

	    	//Form Lead History
	    	'FormLead button[action=Save]':{
	    		click: this.save
	    	},
	    	'FormLead button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	"FormLead combo[name=contact_id]":{
	    		select: this.selectContact
	    	},
	    	"FormLead button[action=AddContact]":{
	    		click: this.addContact
	    	},
	    	//Form Lead Website
	    	'FormLeadWebsite button[action=Save]':{
	    		click: this.save_website
	    	},
	    	'FormLeadWebsite button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	"FormLeadWebsite combo[name=contact_id]":{
	    		select: this.selectContact
	    	},
	    	"FormLeadWebsite button[action=AddContact]":{
	    		click: this.addContact
	    	},
	    	//Form Lead Direct Sale
	    	'FormLeadDirectSale button[action=Save]':{
	    		click: this.save_lead_direct_sale
	    	},
	    	'FormLeadDirectSale button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	"FormLeadDirectSale combo[name=contact_id]":{
	    		select: this.selectContact
	    	},
	    	"FormLeadDirectSale button[action=AddContact]":{
	    		click: this.addContact
	    	},
	    	//Form Lead Info
	    	'FormLeadInfomation button[action=Save]':{
	    		click: this.save_lead_info
	    	},
	    	'FormLeadInfomation button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	'FormLeadInfomation button[action=AddContact]':{
	    		click: this.addContact
	    	},
	    	'FormLeadInfomation combo[name=contact_id]':{
	    		select: this.selectContact
	    	}

	    });
	},

	clickInfo:function(btn){
		var container = btn.up('leadIndex');
		btn.down('combo[name=status1]')
	},
	addContact:function(){
		App.app.getController("sale.Contact").add();
	},
	selectContact:function(combo , records){
		var rec = records[0];
		var frm = combo.up("form");

		frm.getForm().setValues(rec.data);
	},
	search_web_site:function(field){
		var store = this.getSaleLeadWebsiteStore();
		var params={
			string:field.getValue()
		}
		Util.loadStoreSearch(store, params);
	},
	search_direct_sale:function(field){
		var store = this.getSaleLeadDirectsaleStore();
		var params={
			string:field.getValue()
		}
		Util.loadStoreSearch(store, params);
	},
	search:function(field){
		var store = this.getSaleLeadStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},


	add:function(btn){
		var conatiner = btn.up('leadIndex');
		var form = conatiner.down('FormLead');
		form.getForm().reset(true);
		conatiner.setActiveItem(form);

	},
	add_lead_direct_sale:function(btn){
		var conatiner = btn.up('leadIndex');
		var form = conatiner.down('FormLeadDirectSale');
		form.getForm().reset(true);
		conatiner.setActiveItem(form);
	},

	add_lead_info:function(btn){
		var conatiner = btn.up('leadIndex');
		var form = conatiner.down('FormLeadInfomation');
		form.getForm().reset(true);
		conatiner.setActiveItem(form);
	},
	edit: function(btn){
		
		var conatiner = btn.up('leadIndex');
		var form = conatiner.down('FormLead');
		var record = Util.getRecord(btn);
		
		if (record) {			
			form.getForm().reset(true);
			form.loadRecord(record);
			form.getForm().setValues(record.contact);
			conatiner.setActiveItem(form);
		};

	},
	edit_lead_direct_sale:function(btn){

		var conatiner = btn.up('leadIndex');
		var form = conatiner.down('FormLeadDirectSale');
		var record = Util.getRecord(btn);
		
		if (record) {			
			form.getForm().reset(true);
			form.loadRecord(record);
			form.getForm().setValues(record.contact);
			conatiner.setActiveItem(form);
		};
	},
	edit_website:function(btn){
		var conatiner = btn.up('leadIndex');
		var form = conatiner.down('FormLeadWebsite');
		var record = Util.getRecord(btn);
		
		if (record) {			
			form.getForm().reset(true);
			form.loadRecord(record);
			form.getForm().setValues(record.contact);
			conatiner.setActiveItem(form);
		};
	},
	edit_lead_info:function(btn){
		var conatiner = btn.up('leadIndex');
		var form = conatiner.down('FormLeadInfomation');
		var record = Util.getRecord(btn);
		
		if (record) {			
			form.getForm().reset(true);
			form.loadRecord(record);
			form.getForm().setValues(record.contact);
			conatiner.setActiveItem(form);
		};
	},
	save :function(btn){

		var form = btn.up('form').getForm(),
		frm = btn.up('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSaleLeadStore();
  		direct_sale_store = me.getSaleLeadDirectsaleStore();

  		if(form.isValid() && me.validateContactnLeadOwner(frm ,values)){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Lead');
  				model.set(values);
  				store.add(model);
  			};

	  		me.storeSync(store, me , btn );
	  		me.direct_sale_store.load();

  		}else{
  			Util.msg('Please entry require field');
  		}


	},
	save_website:function(btn){
		var form = btn.up('form').getForm(),
		frm = btn.up('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSaleLeadWebsiteStore();
  
  		if(form.isValid() && me.validateContactnLeadOwner(frm ,values)){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Lead');
  				model.set(values);
  				store.add(model);
  			};

	  		me.storeSync(store, me , btn );

  		}else{
  			Util.msg('Please entry require field');
  		}
	},
	save_lead_direct_sale:function(btn){
		var form = btn.up('form').getForm(),
		frm = btn.up('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSaleLeadDirectsaleStore();
  
  		if(form.isValid() && me.validateContactnLeadOwner(frm ,values)){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Lead');
  				model.set(values);
  				store.add(model);
  			};

	  		me.storeSync(store, me , btn );

  		}else{
  			Util.msg('Please entry require field');
  		}
	},	
	save_lead_info:function(btn){
		var form = btn.up('form').getForm(),
		frm = btn.up('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSaleLeadInfomationStore();
  
  		if(form.isValid() && me.validateContactnLeadOwner(frm ,values)){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Lead');
  				model.set(values);
  				store.add(model);
  			};

	  		me.storeSync(store, me , btn );

  		}else{
  			Util.msg('Please entry require field');
  		}
	},
	storeSync:function(store, me , btn ){
		var recs = store.getModifiedRecords();
		if (recs.length > 0) {

			Ext.MessageBox.wait("Please System Proccessing Data.....", "Please Wait")
		};
		store.sync({
				success: function() {
					Ext.MessageBox.hide();
					me.cancel(btn);
					store.load();
					App.app.getStore("combo.Lead").load() ;

				},
				failure: function(batch, option) {
					Ext.MessageBox.hide();
	            store.rejectChanges();

					var msg = option.batch.proxy.reader.rawData.message;
					Ext.MessageBox.show({
						title: 'Error',
						msg: msg,
						icon: Ext.MessageBox.ERROR,
						buttons: Ext.Msg.OK
					});

				},
				scope: this
			});
	},

	validateContactnLeadOwner:function(form ,values){

		if (!(values.contact_id > 0) ) {
			form.down("combo[name=contact_id]").setValue("");
			return false ;
		};

		if (!(values.lead_owner > 0) ) {
			form.down("combo[name=lead_owner]").setValue("");
			return false ;
		};

		return true ;

	},

	SelectLeadPurpose: function(dv, record, item, index, e){
		id = record.get('id');
		var store = this.getSaleLeadPurposeStore().load({
			params: {
				id:id
			}
		});
	
	},

	cancel:function(btn){
		var conatiner = btn.up('leadIndex');
		var grid = conatiner.down('tabpanel');
		conatiner.setActiveItem(grid);
	}
})
