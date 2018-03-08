Ext.define('App.store.item.ItemSKU', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,    
    controllerLoad: false,
    model: 'App.model.ItemSKU',
    proxy:App.conf.Store.proxy('/Items/get_sku')

});
