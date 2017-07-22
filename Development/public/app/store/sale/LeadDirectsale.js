Ext.define('App.store.sale.LeadDirectsale', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
     groupField: 'status_name',
    model: 'App.model.Lead',
    proxy:{
 	    	type: 'rest',
 	    	url : '/lead_direct_sale',
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