Ext.define('App.store.service.Maintenance', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad: false,
    model: 'App.model.Maintenance',
    proxy:App.conf.Store.proxy('/maintenance')

});