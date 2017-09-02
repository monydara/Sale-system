Ext.define('App.store.sale.CustomPrice', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.CustomPrice',
    proxy:{
 	    	type: 'rest',
 	    	url : '/custom_prices',
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
        			return { data: record.data };
        		}
	        },
	        listeners :
			{
				exception : function(proxy, response, operation)
				{
					Ext.MessageBox.show(
					{
						title : 'REMOTE EXCEPTION', msg : operation.getError(), icon : Ext.MessageBox.ERROR, buttons : Ext.Msg.OK
					});
				}
			}
    }
});
