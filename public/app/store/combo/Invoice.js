Ext.define('App.store.combo.Invoice', {
	extend: 'Ext.data.Store',
	queryMode: 'remote',
	autoLoad:false,
	model: 'App.model.Invoice',
    proxy:App.conf.Store.proxy('/SaleInvoice/combo')

});
