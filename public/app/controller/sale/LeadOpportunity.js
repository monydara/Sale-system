Ext.define('App.controller.sale.LeadOpportunity', {
	extend: 'Ext.app.Controller',
	views:[
		'sale.leadOpportunity.Index',
		'sale.leadOpportunity.FmLead',
	],
	stores:[
		"combo.Customer",
		"combo.Lead",
		'sale.LeadOpportunity',
		'combo.Contact',
		'combo.UM',
		'combo.Item',
		"sale.LeadOppunityDetail",
		'combo.SaleRepresentative',
		'combo.Source',
		'combo.OpportunityStatus',

	],
	init: function() {

	    this.control({
	    	'leadOpportunityIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'leadOpportunityIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'leadOpportunityIndex textfield[name=Search]':{
	    		change: this.search
	    	},

	    	'FormLeadOpportunity button[action=Save]':{
	    		click: this.save
	    	},
	    	'FormLeadOpportunity button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	"FormLeadOpportunity combo[name=contact_id]":{
	    		select: this.selectContact
	    	},
	    	"FormLeadOpportunity button[action=AddContact]":{
	    		click: this.addContact
	    	},
	    	"FormLeadOpportunity button[action=AddItemDetail]":{
	    		click: this.addItemDetail
	    	},
	    	"FormLeadOpportunity combo[name=oppunity_to]":{
	    		change: this.showAndHideCustomer
	    	},
	    	"FormLeadOpportunity checkbox[name=is_with_item]":{
	    		change: this.toggleGrid
	    	}

	    });
	},
	deleteDetailRecord:function(grid , rec ){
		var me = this;
		Ext.MessageBox.confirm('Confirm', 'Are you sure to remove this item ?', function(btn) {
			if (btn == 'yes') {
				var store = grid.getStore();
				if (rec.get('id') > 0) {
					rec.set("_destroy", true);
				}
				store.remove(rec);
			}
		});

	},
	toggleGrid:function(field ,value){
		if (value) {
			field.up("form").down("grid").show();
		}else{
			field.up("form").down("grid").hide();
		};
	},
	showAndHideCustomer:function(combo , value){
		var form = combo.up("form");
		if (value == "Customer") {
			form.down("combo[name=lead_id]").hide();
			form.down("combo[name=customer_id]").show();
		}else{

			form.down("combo[name=lead_id]").show();
			form.down("combo[name=customer_id]").hide();

		};



	},
	addItemDetail:function(btn){

		var model = Ext.create("App.model.LeadOppunityDetail");
		var store = btn.up("grid").getStore();
		store.add(model);
	},
	addContact:function(){
		App.app.getController("sale.Contact").add();
	},
	selectContact:function(combo , records){
		var rec = records[0];
		var frm = combo.up("form");

		frm.getForm().setValues(rec.data);
	},
	search:function(field){
		var store = this.getSaleLeadStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},


	add:function(btn){
		var conatiner = btn.up('leadOpportunityIndex');
		var form = conatiner.down('FormLeadOpportunity');
		this.getSaleLeadOppunityDetailStore().removeAll();

		form.getForm().reset(true);
		conatiner.setActiveItem(form);

	},
	edit: function(btn){

		var conatiner = btn.up('leadOpportunityIndex');
		var form = conatiner.down('FormLeadOpportunity');
		var record = Util.getRecord(btn);
		this.getSaleLeadOppunityDetailStore().load({
			params:{
				opportunity_id : record.get("id")
			}
		})
		if (record) {
			form.getForm().reset(true);
			form.loadRecord(record);
			form.getForm().setValues(	record.data.contact);
			conatiner.setActiveItem(form);
		};

	},

	save :function(btn){

		var form = btn.up('form').getForm(),
		frm = btn.up('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSaleLeadOpportunityStore();

  		if(form.isValid() ){
  			values["lead_opportunity_detail_attributes"] =Util.getItemStore(me.getSaleLeadOppunityDetailStore());
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.LeadOpportunity');
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

		if (!(values.leadOppunity_owner > 0) ) {
			form.down("combo[name=leadOppunity_owner]").setValue("");
			return false ;
		};

		return true ;

	},
	cancel:function(btn){
		var conatiner = btn.up('leadOpportunityIndex');
		var grid = conatiner.down('grid[name=index]');
		conatiner.setActiveItem(grid);
	}
})
