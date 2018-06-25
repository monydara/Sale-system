Ext.define('App.model.ItemCategory', {
    extend: 'Ext.data.Model',
    fields: [ 
		'id',
		'sub_of_id',
		'name',
		'remark',
		'is_active'
    ]
    
});