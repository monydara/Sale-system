Ext.define('App.store.setup.Position', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Position',
    proxy:App.conf.Store.proxy('/position')


});