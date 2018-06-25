Ext.define('App.store.combo.AdjustStockType', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.AdjustStockType',
    proxy:App.conf.Store.proxy('/AdjustStockType/combo')

});