Ext.define('App.store.sale.SaleRepresentative', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.SaleRepresentative',

    proxy:App.conf.Store.proxy('/sale_representative')

});