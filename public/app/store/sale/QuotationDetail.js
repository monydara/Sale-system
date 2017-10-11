Ext.define('App.store.sale.QuotationDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.QuotationDetail',
    controllerLoad:false,
    proxy:App.conf.Store.proxy('/SaleQuotation/get_item_detail')


});