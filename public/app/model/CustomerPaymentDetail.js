Ext.define('App.model.CustomerPaymentDetail', {
    extend: 'Ext.data.Model',
    fields: [ 
		"id",
		"invoice_id",
		"amount",
		"description",
		"created_by",
		"modify_by",
		"created_at",
		"updated_at",

		// ===additional field
		"invoice_no",
		"invoice_amount",
		"paid_amount",
		"unpaid_amount",
		"amount",
		"balance"

		
		
    ]
    
});