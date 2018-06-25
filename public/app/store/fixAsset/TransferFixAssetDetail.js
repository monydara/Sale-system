Ext.define('App.store.fixAsset.TransferFixAssetDetail',{
	extend: 'Ext.data.Store',
	queryMode:'local',
	autoLoad: false,
	ControllerLoad: false,
	model: 'App.model.TransferFixAssetDetail',
    proxy:App.conf.Store.proxy('/TransferFixAsset/get_item_detail')


})


