Ext.define('App.store.combo.SaleRepresentative', {
	extend: 'Ext.data.Store',
	queryMode: 'local',
	autoLoad:false,
	model: 'App.model.SaleRepresentative',
    proxy:App.conf.Store.proxy('/SaleRepresentative/combo')

});