Ext.define('App.store.combo.CustomPrice', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.CustomPrice',
    proxy:App.conf.Store.proxy('/CustomPrices/combo')

});
