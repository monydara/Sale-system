Ext.define('App.store.admin.Auditrail', {
    extend: 'Ext.data.Store',
//    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.admin.Auditrail',
    proxy:App.conf.Store.proxy('/auditrails')



});