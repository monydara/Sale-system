Ext.define('App.controller.report.Report', {
	extend: 'Ext.app.Controller',
	views:[
		'reports.customerlist.Index',

	],

	stores:[

		//--- combo store
		'combo.Area',
		'combo.CustomerType',
		'combo.CustomPrice',
		'combo.Customer',
		'combo.Currency',
		'combo.Item',
		'combo.Invoice',
		'combo.ItemCategory',
		//-- report store
		'report.ReportCustomer',
		'report.ReportCustomerBalanceDetail',
		'report.ReportCustomerBalance',
		'report.ReportSale',
		'report.ReportSaleItem',
		'report.ReportItem'

	],
	init: function() {

	    this.control({
	    	'report button[action=Search]':{
	    		click: this.search
	    	},
	    	'report button[action=Option]':{
	    		click: this.toggleOptForm
			},
			'report button[action=Print]':{
	    		click: this.printReport
	    	},
	    	'report button[action=Reset]':{
	    		click: this.resetFilterForm
	    	},
	    	'checkboxfield[name=column]':{
	    		change: this.toggleColumn
	    	},

	    });
	},

	printReport:function(btn){
		var me = this 
		window.open("/ReportCustomers/print.pdf")
		// Util.ajax("/ReportCustomers/print" , {},me.showInvoice)
	},
	showInvoice:function(data){
		console.log(data)
	},
	resetFilterForm:function(btn) {
		var form = btn.up("form");
		form.reset();
	},
	search:function(btn){
		var form = btn.up("form"),
		 grid = form.up("report").down("grid"),
		 store=grid.getStore();

		if (form.isValid()){

			var params =form.getValues();

			Util.loadStoreSearch(store, params);

		}else{
			Util.msg("Please entry require field");
		}

	},
	toggleColumn:function(txt , value ) {
		var name =txt.inputValue;
		var g = txt.up("report").down('grid');
		g.columns.forEach(function(col){
			if (col.dataIndex == name) {
				if (value) {

					col.show();
				}else {

					col.hide();
				}
			}
		});

	},
	toggleOptForm:function(btn){
			var fmCol = btn.up("form").down("panel[name=columns]");
			if (fmCol.isHidden()) {
				console.log("Show from filter");
				fmCol.show();
			}else{
				console.log("Hide from filter");
				fmCol.hide();
			}
	}

});
