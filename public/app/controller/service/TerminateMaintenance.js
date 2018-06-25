Ext.define('App.controller.service.TerminateMaintenance', {
	extend: 'Ext.app.Controller',
	views: [
		'service.terminateMaintenance.Index',
	],
	stores: [
		'service.TerminateMaintenance',
	],
	init: function() {

		this.control({

			'terminateMaintenanceIndex textfield[name=Search]': {
				change: this.search
			},
			'terminateMaintenanceIndex button[action=Terminate]': {
				click: this.terminateMaintenance
			}

		});
	},

	terminateMaintenance: function(btn) {
		var conatiner = btn.up('terminateMaintenanceIndex');
		var record = Util.getRecord(btn), me = this;
		console.log(record);
		if(record) {
			Ext.MessageBox.confirm('Confirm', 'Are you sure to Cancel this Quotation?', function(btn) {
				if (btn == 'yes') {
					record.set("status", 0);
					me.getServiceTerminateMaintenanceStore().sync();
					Ext.MessageBox.show({
						title: 'Terminated',
						msg: 'Terminate is Successfully!',
						icon: Ext.MessageBox.INFO,
						buttons: Ext.Msg.OK
					});
				}
			});
		};
	},

	search: function(field) {
		var store = this.getServiceTerminateMaintenanceStore();
		var params = {
			search_string: field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},
})