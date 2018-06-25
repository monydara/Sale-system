Ext.define('App.store.sale.LeadPurpose', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Lead',
    groupField: 'status_name',
    proxy:App.conf.Store.proxy('/Lead/get_lead_purpose')


});