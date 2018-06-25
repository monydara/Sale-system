Ext.define('App.store.combo.Item', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Item',
    proxy:App.conf.Store.proxy('/Items/combo')

});