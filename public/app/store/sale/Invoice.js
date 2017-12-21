Ext.define('App.store.sale.Invoice', {
	extend: 'Ext.data.Store',
	queryMode: 'local',
	autoLoad:false,
	model: 'App.model.Invoice',
    proxy:App.conf.Store.proxy('/sale_invoice')
});