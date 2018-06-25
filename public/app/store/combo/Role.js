Ext.define('App.store.combo.Role', {
    extend: 'Ext.data.Store',
//    queryMode: 'local',
    autoLoad:true,
    model: 'App.model.admin.Role',
    proxy:App.conf.Store.proxy('/Role/combo')

});
