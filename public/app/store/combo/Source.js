Ext.define('App.store.combo.Source', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.Source',
    proxy:App.conf.Store.proxy('/Sources/combo')

});
