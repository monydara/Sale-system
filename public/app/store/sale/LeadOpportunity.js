Ext.define('App.store.sale.LeadOpportunity', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.LeadOpportunity',
    proxy:App.conf.Store.proxy('/lead_oppunities')
});
