Ext.define('App.model.AdjustStockDetail', {
    extend: 'Ext.data.Model',
    fields: [ 
		'id',
		'adjust_stock_id',
		'item_id',
		'serial_no',
		'qty',
		'um_id',
		'multiplier',
		'total_qty',
		'cost',
		'adjust_type_id',
		'created_by',
		'modify_by',

		"item_name",
		"um",
		"ajust_type_name"
    ]
    
});