Ext.define('App.store.sale.LeadOppunityDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.LeadOppunityDetail',
    proxy:App.conf.Store.proxy('/LeadOppunities/get_detail')


});
