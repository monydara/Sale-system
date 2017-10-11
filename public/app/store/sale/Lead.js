Ext.define('App.store.sale.Lead', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Lead',
    groupField: 'status_name',
    proxy:App.conf.Store.proxy('/lead')

});