Ext.define('App.store.combo.ItemType', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.ItemType',
    proxy:App.conf.Store.proxy('/ItemType/combo')

});