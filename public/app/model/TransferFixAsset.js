Ext.define('App.model.TransferFixAsset', {
    extend: 'Ext.data.Model',
    fields: [ 
		'id ',
		'auto_code',
		'date date',
		'ref_no',
		'from_locatlion_id',
		'to_location_id',
		'remark text',
		'create_by',
		'modify_by',
		'updated_at',
		'transfer_stock_detail_attributes',	
    ]
    
});