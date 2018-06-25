Ext.define('App.store.combo.ItemCategory', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.ItemCategory',
    proxy:App.conf.Store.proxy('/ItemCategories/combo')

});