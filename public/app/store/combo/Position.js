Ext.define('App.store.combo.Position', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Position',
    proxy:App.conf.Store.proxy('/Position/combo')


});