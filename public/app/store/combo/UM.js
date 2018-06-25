Ext.define('App.store.combo.UM', {
    extend: 'Ext.data.Store',
    queryMode: 'remote',
  //  autoLoad:false,
    model: 'App.model.UM',
    proxy:App.conf.Store.proxy('/Ums/combo')

});
