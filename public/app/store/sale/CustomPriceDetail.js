Ext.define('App.store.sale.CustomPriceDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.CustomPriceDetail',
    groupField: 'status_name',
    proxy:App.conf.Store.proxy('/CustomPrices/get_item_detail')

});
