Ext.define('App.model.Maintenance', {
    extend: 'Ext.data.Model',
    fields: [ 
		'id',
		'maintenance_no',
		'invoice_id',
		'customer_id',
		'amount',
		'status',
		'start_date',
		'end_date',
		'remark',
		'created_by',
		'modify_by',

	    'maintenance_detail_attributes'
    ]
    
});