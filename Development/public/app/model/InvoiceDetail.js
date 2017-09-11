Ext.define('App.model.InvoiceDetail', {
	extend: 'Ext.data.Model',
	fields: [{
			name: "id",
			type: 'int'
		},
		"invoice_id",
		"item_id",
		"description",
		"qty",
		"um_id",
		"multiplier",
		"total_qty",
		"price",
		"extent_price",
		"created_by",
		"modify_by",
		"currency_id",
		"dis_percentage",
		// ====
		"item_name",
		"code",
		"barcode",
		"currency_symbol",
		"um",
		"_destroy"
	],


});