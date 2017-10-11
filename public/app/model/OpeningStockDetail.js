Ext.define('App.model.OpeningStockDetail', {
    extend: 'Ext.data.Model',
    fields: [ 
    	'id',
    	'opening_stock_id',
    	'item_id',
    	'serial_no',
    	'qty',
    	'um_id',
        'multiplier',
    	'total_qty',
    	'cost',
    	'created_by',
    	'modify_by',
    ]
    
});