Ext.define('App.store.admin.User', {
    extend: 'Ext.data.Store',
//    queryMode: 'local', 
    autoLoad:false,

    model: 'App.model.admin.User',
    proxy:App.conf.Store.proxy('/users')


});