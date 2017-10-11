Ext.define('App.store.setup.Area', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Area',
    proxy:App.conf.Store.proxy('/area')

});