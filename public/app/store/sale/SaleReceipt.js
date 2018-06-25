Ext.define('App.store.sale.SaleReceipt', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.Invoice',
    proxy:App.conf.Store.proxy('/sale_receipts')

});