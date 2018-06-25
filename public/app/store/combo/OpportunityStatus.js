Ext.define('App.store.combo.OpportunityStatus', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.Lookup',
    proxy:App.conf.Store.proxy('/LeadOppunities/combo')

});
