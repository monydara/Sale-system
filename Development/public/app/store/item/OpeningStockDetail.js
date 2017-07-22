Ext.define('App.store.item.OpeningStockDetail', {
	extend: 'Ext.data.Store',
	queryMode: 'local',
	autoLoad: false,
	controlerLoad: false,
	model: 'App.model.OpeningStockDetail',
	proxy: {
		type: 'rest',
		url: '/OpeningStock/get_item_detail',
		reader: {
			type: 'json',
			root: 'data',
			rootProperty: 'data',
			totalProperty: 'total',
			successProperty: 'success',
			messageProperty: 'message'
		},
		writer: {
			getRecordData: function(record) {
				return {
					data: record.data
				};
			}
		},
		listeners: {
			exception: function(proxy, response, operation) {
				Ext.MessageBox.show({
					title: 'REMOTE EXCEPTION',
					msg: operation.getError(),
					icon: Ext.MessageBox.ERROR,
					buttons: Ext.Msg.OK
				});
			}
		}
	}
});