Ext.define('App.store.sale.CustomPrice', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.CustomPrice',

    proxy:App.conf.Store.proxy('/custom_prices')

});
