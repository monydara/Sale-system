Ext.define('App.store.sale.CustomerPaymentDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    controllerLoad:false,
    groupField: 'invoice_no',
    model: 'App.model.CustomerPaymentDetail',
    proxy:App.conf.Store.proxy('/CustomerPayment/get_item_detail')


});