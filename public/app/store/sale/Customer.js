Ext.define('App.store.sale.Customer', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Customer',
    proxy:App.conf.Store.proxy('/customers')

});