Ext.define('App.store.combo.Menu', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.Menu',
    proxy:App.conf.Store.proxy('/SysMenu/combo')

});
