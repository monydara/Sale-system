Ext.define('App.store.sale.CustomerPayment', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.CustomerPayment',
    proxy:App.conf.Store.proxy('/customer_payment')

});