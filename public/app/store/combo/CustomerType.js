Ext.define('App.store.combo.CustomerType', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.CustomerType',
    proxy:App.conf.Store.proxy('/CustomerTypes/combo')

});
