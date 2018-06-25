Ext.define('App.store.admin.RelMenu', {
    extend: 'Ext.data.Store',
//    queryMode: 'local',
    autoLoad:false,
    controllerLoad:false,
    groupField: 'parent_name',
    model: 'App.model.admin.SysMenu',
    proxy:App.conf.Store.proxy('/Role/get_menu_list')

});
