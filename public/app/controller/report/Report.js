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
		'report.ReportCustomer'
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
				fmCol.show();
			}else{
				fmCol.hide();
			}
	}

});
