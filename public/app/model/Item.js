Ext.define('App.model.Item', {
    extend: 'Ext.data.Model',
    fields: [
	    'id',
		'name',
		'code',
		'barcode',
		'item_type_id',
		'category_id',
		'um_id',
		'price',
		'cost_avc',
		're_order_point',
		'is_use_serial',
		'image_url',
		'series_id',
		'model_id',
		'color',
		'depreciation_method_id',
		'depreciation_type_id',
		'depreciation_rate',
		'sale_description',
		'purchase_description',
		'memo',
		'status',
		'create_by',
		'modify_by',
		'um',
    'currency_id',
    'currency_name'
   ]

});
