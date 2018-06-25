Ext.define('App.model.TransferFixAssetDetail', {
    extend: 'Ext.data.Model',
    fields: [ 
		'id ',
		'item_id',
		'transfer_stock_id',
		'qty',
		'um_id',
		'total_qty',
		'serial_no',
		'created_by',
		'modify_by',
		'updated_at',

		"_destroy"
    ]
    
});