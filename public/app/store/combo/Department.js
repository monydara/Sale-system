Ext.define('App.store.combo.Department', {
    extend: 'Ext.data.Store',
//    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.admin.Department',
    proxy:App.conf.Store.proxy('/Department/combo')


});
