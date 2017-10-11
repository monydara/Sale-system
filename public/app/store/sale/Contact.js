Ext.define('App.store.sale.Contact', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.Contact',
    proxy:App.conf.Store.proxy('/contact')
});
