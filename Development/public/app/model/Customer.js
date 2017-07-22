Ext.define('App.model.Customer', {
    extend: 'Ext.data.Model',
    fields: [ 
		'id',
		"code",
		'name',
		'legal_name',
		'customer_type',
		'customer_area_id',
		'vat_tin',
		'phone',
		'mobile',
		'email',
		'website',
		'address',
		'contact_name',
		'contact_mobile',
		'contact_id_card',
		'contact_email',
		'contact_address',
		'is_system_created',
		'create_by',
		'modify_by',
		'created_at',
		'updated_at',

		'area_name'
    ]
    
});