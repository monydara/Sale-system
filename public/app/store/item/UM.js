Ext.define('App.store.item.UM', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.UM',
    proxy:App.conf.Store.proxy('/ums')


});