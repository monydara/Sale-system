Ext.define('App.store.sale.InvoiceDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.InvoiceDetail',
    controllerLoad:false,
    proxy:App.conf.Store.proxy('/SaleInvoice/get_item_detail')

});