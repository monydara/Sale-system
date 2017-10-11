Ext.define('App.store.service.TerminateMaintenance', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad: false,
    model: 'App.model.Maintenance',

    proxy:App.conf.Store.proxy('/terminate_maintenance')


});