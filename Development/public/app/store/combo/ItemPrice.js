Ext.define('App.store.combo.ItemPrice', {
    extend: 'Ext.data.Store',
    queryMode: 'remote',
    autoLoad:false,
    model: 'App.model.ItemPrice',
    proxy:{
 	    	type: 'rest',
 	    	url : '/ItemPrice/combo',
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