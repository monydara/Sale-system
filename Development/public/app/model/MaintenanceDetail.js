Ext.define('App.model.MaintenanceDetail', {
    extend: 'Ext.data.Model',
    fields: [ 
    	'id',
        'maintenance_id',
        'item_id',
        'description',
        'serial_no',
        'qty',
        'multiplier',
        'um_id ',
        'total_qty',
        'is_free',
        'price',
        'extend_price',
        'created_by',
        'modify_by',
    ]
    
});