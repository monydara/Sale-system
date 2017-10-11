Ext.define('App.model.OpeningStock', {
    extend: 'Ext.data.Model',
    fields: [ 
		'id',
		'location_id',
	    'date',
	    'ref_no',
	    'remark',
	    'created_by',
	    'modify_by',

	    'opening_stock_detail_attributes'
    ]
    
});