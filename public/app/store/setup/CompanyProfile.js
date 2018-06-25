Ext.define('App.store.setup.CompanyProfile', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.CompanyProfile',
    proxy:App.conf.Store.proxy('/company_profile')

});