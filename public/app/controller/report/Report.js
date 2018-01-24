Ext.define('App.controller.report.Report', {
	extend: 'Ext.app.Controller',
	views:[
		'reports.customerlist.Index',

	],
	requires:[
		'App.view.template.cmbCustomerArea'
	],
	stores:[
		'combo.Area',
		'report.ReportCustomer',
		'combo.CustomerType',
		'combo.CustomPrice'
	],
	init: function() {

	    this.control({
	    	'reportCustomerList button[action=Search]':{
	    		click: this.search
	    	},
	    	'reportCustomerList button[action=Option]':{
	    		click: this.toggleOptForm
	    	},
	    	'checkboxfield[name=column]':{
	    		change: this.toggleColumn
	    	},

	    });
	},
	search:function(btn){
		var form = btn.up("form"),
		 grid = form.up("reportCustomerList").down("grid"),
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
		var g = txt.up("reportCustomerList").down('grid');
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
