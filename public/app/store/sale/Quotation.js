Ext.define('App.store.sale.Quotation', {
	extend: 'Ext.data.Store',
	queryMode: 'local',
	autoLoad:false,
	model: 'App.model.Quotation',
    proxy:App.conf.Store.proxy('/sale_quotation')


});