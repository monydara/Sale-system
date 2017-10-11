Ext.define('App.store.combo.Customer', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Customer',

    proxy:App.conf.Store.proxy('/Customers/combo')

});