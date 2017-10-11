Ext.define('App.store.combo.Lead', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.Lead',
    proxy:App.conf.Store.proxy('/Lead/combo')

});
