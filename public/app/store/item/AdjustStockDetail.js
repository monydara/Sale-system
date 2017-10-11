Ext.define('App.store.item.AdjustStockDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad: false,
    controllerLoad: false,
    model: 'App.model.AdjustStockDetail',
    proxy:App.conf.Store.proxy('/AdjustStock/get_item_detail')


});