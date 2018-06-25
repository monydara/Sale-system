Ext.define('App.store.combo.Quotation', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Quotation',
    proxy:App.conf.Store.proxy('/SaleQuotation/combo')

});