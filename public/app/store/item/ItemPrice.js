Ext.define('App.store.item.ItemPrice', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.ItemPrice',
    proxy:App.conf.Store.proxy('/Items/get_detail')

});
