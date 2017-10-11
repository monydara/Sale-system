Ext.define('App.model.Location', {
    extend: 'Ext.data.Model',
    fields: [ 
		'id',
		'name',
		'phone',
		'fax',
		'website',
		'email',
		'address',
		'remark',
		'is_active',
		'create_by',
		'modify_by',
    ]
    
});