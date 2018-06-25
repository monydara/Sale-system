Ext.define('App.store.item.OpeningStockDetail', {
	extend: 'Ext.data.Store',
	queryMode: 'local',
	autoLoad: false,
	controlerLoad: false,
	model: 'App.model.OpeningStockDetail',
    proxy:App.conf.Store.proxy('/OpeningStock/get_item_detail')


});