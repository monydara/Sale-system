Ext.define('App.store.setup.Menu', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.Menu',
    proxy:App.conf.Store.proxy('/sys_menu')
});
