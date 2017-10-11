Ext.define('App.store.Config',{
    singleton: true,

    initParam:function (obj) {
        // add value to global varibble
        var me = App.store.Config ;
        for(var param in obj ){
            me[param]= obj[param]
        }

    },
    token: ''

})