Ext.define('App.conf.Store', {
    singleton: true,
    token:'',
    proxy:function(url){
        return {
            type: 'rest',
            url : url,
            headers: {

                'Authorization':'Token token='+ App.conf.Store.token,
            },
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
    }

}
)
