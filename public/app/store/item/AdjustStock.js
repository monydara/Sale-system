Ext.define('App.store.item.AdjustStock', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.AdjustStock',
    proxy:App.conf.Store.proxy('/adjust_stock')

});