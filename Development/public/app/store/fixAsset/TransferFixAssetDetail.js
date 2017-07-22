Ext.define('App.store.fixAsset.TransferFixAssetDetail',{
	extend: 'Ext.data.Store',
	queryMode:'local',
	autoLoad: false,
	ControllerLoad: false,
	model: 'App.model.TransferFixAssetDetail',
	proxy:{
		type: 'rest',
		url: '/TransferFixAsset/get_item_detail',
		reader:{
			type: 'json',
			root: 'data',
			rootProperty: 'total',
			messageProperty: 'message'
		},
		writer: {
			getRecordData: function(record){
				return {date: record.data};
			},
			listeners :
			{
				exception : function(proxy, response, operation)
				{
					Ext.MessageBox.show(
						{
							title: 'REMOTE EXCEPTION', msg : operation.getError(), icon : Ext.MessageBox.ERROR, buttons : Ext.Msg.OK
						});
				}
			}
		}
	}
})


