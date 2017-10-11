Ext.define('App.store.fixAsset.TransferFixAsset',{
	extend: 'Ext.data.Store',
	queryMode:'local',
	autoLoad:false,
	model: 'App.model.TransferFixAsset',
    proxy:App.conf.Store.proxy('/transfer_fix_asset')
})


