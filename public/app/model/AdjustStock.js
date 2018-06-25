Ext.define('App.model.AdjustStock', {
    extend: 'Ext.data.Model',
    fields: [ 
		'id',
		'date',
		'auto_code',
		'ref_no',
		'location_id',
		'remark',
		'created_by',
		'modify_by',

		'adjust_stock_detail_attributes'
    ]
    
});