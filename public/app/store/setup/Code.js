Ext.define('App.store.setup.Code', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Code',
    proxy:App.conf.Store.proxy('/code')

});