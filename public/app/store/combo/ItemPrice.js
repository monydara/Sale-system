Ext.define('App.store.combo.ItemPrice', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.ItemPrice',

    proxy:App.conf.Store.proxy('/ItemPrice/combo')

});