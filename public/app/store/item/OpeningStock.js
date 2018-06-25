Ext.define('App.store.item.OpeningStock', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.OpeningStock',
    proxy:App.conf.Store.proxy('/opening_stock')

});