Ext.define('App.store.item.Brand', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Brand',
    proxy:App.conf.Store.proxy('/brands')


});