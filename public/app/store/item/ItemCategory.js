Ext.define('App.store.item.ItemCategory', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.ItemCategory',
    proxy:App.conf.Store.proxy('/item_categories')

});