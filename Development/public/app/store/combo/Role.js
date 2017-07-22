Ext.define('App.store.combo.Role', {
    extend: 'Ext.data.Store',
//    queryMode: 'local',
    autoLoad:true,
    model: 'App.model.admin.Role',
     proxy: {
        		type: 'rest',
        		url:'/Role/combo',
		        reader: {
		            type: 'json',
		            root: 'data',
		            successProperty: 'success'
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
							title : 'REMOTE EXCEPTION',
							msg : operation.getError(),
							icon : Ext.MessageBox.ERROR,
							buttons : Ext.Msg.OK
						});
					}
				}
    	}

});
