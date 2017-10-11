Ext.define('App.store.admin.Role', {
    extend: 'Ext.data.Store',
//    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.admin.Role',

    proxy:App.conf.Store.proxy('/role')


});
