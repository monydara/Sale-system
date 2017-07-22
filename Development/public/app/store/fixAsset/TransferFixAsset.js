Ext.define('App.store.fixAsset.TransferFixAsset',{
	extend: 'Ext.data.Store',
	queryMode:'local',
	autoLoad:false,
	model: 'App.model.TransferFixAsset',
	proxy:{
		type: 'rest',
		url: '/transfer_fix_asset',
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


