Ext.define('App.model.Invoice', {
    extend: 'Ext.data.Model',
    fields: [ 
		"id",
		"invoice_no",
		"location_id",
		"customer_id",
		"sale_quotation_id",
		"date",
		"due_date",
		"ref_no",
		"total_amount",
		"discount_percentag",
		"discount_amount",
		"tax_percentag",
		"tax_amount",
		"grand_total_amount",
		"memo",
		"payment_flag",
		"status",
		"created_by",
		"modify_by",

		"invoice_detail_attributes"
    ],
    
    
});