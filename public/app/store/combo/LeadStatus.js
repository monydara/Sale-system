Ext.define('App.store.combo.LeadStatus', {
	extend: 'Ext.data.Store',
	queryMode: 'local',
	autoLoad:false,
	model: 'App.model.Lookup',
    proxy:App.conf.Store.proxy('/Lookups/get_lead_status')

    // proxy: {
	// 	type: 'rest',
	// 	url: '/Lookups/get_lead_status',
    //
	// 	reader: {
	// 		type: 'json',
	// 		root: 'data',
	// 		rootProperty: 'data',
	// 		totalProperty: 'total',
	// 		successProperty: 'success',
	// 		messageProperty: 'message'
	// 	},
	// 	writer: {
	// 		getRecordData: function(record) {
    //
	// 			return {
	// 				data: record.data
	// 			};
	// 		},
    //
	// 	},
	// 	listeners: {
	// 		exception: function(proxy, response, operation) {
	// 			Ext.MessageBox.show({
	// 				title: 'REMOTE EXCEPTION',
	// 				msg: operation.getError(),
	// 				icon: Ext.MessageBox.ERROR,
	// 				buttons: Ext.Msg.OK
	// 			});
	// 		},
	// 		write: function(store, operation) {
	// 			var record = operation.getRecords()[0],
	// 				name = Ext.String.capitalize(operation.action),
	// 				verb;
    //
    //
	// 			if (name == 'Destroy') {
	// 				verb = 'Destroyed';
	// 			} else {
	// 				verb = name + 'd';
	// 			}
    //
	// 			console.log("============" + record);
    //
	// 		}
	// 	}
	// }
});
