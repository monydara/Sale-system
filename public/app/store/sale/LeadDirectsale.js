Ext.define('App.store.sale.LeadDirectsale', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
     groupField: 'status_name',
    model: 'App.model.Lead',
    proxy:App.conf.Store.proxy('/lead_direct_sale')

});