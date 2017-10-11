Ext.define('App.store.purchase.Vender', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Vender',
    proxy:App.conf.Store.proxy('/venders')

});