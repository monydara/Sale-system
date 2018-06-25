Ext.define('App.store.combo.Location', {
    extend: 'Ext.data.Store',
    queryMode: 'local', 
    autoLoad:false,
    model: 'App.model.Location',
    proxy:App.conf.Store.proxy('/Locations/combo')

});