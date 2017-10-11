Ext.define('App.model.QuotationDetail', {
	extend: 'Ext.data.Model',
	fields: [{
			name: "id",
			type: 'int'
		},
		"sale_quotation_id",
		"item_id",
		"description",
		"qty",
		"um_id",
		"total_qty",
		"price",
		"extent_price",
		"created_by",
		"modify_by",
		// ====
		"item_name",
		"code",
		"barcode",
		"um",
		"_destroy",
		"image_url"
	],


});