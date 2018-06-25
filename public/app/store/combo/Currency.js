Ext.define('App.store.combo.Currency', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.Currency',
    proxy:App.conf.Store.proxy('/Currencies/combo')

});
