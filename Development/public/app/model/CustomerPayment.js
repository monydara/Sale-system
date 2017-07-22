Ext.define('App.model.CustomerPayment', {
    extend: 'Ext.data.Model',
    fields: [ 
		"id",
		"receipt_no",
		"customer_id",
		"date",
		"ref_no",
		"total_amount",
		"discount_percentag",
		"discount_amount",
		"grand_total_amount",
		"memo",
		"created_by",
		"modify_by", 
		
		"receive_payment_detail_attributes",
		"customer_name"
		
    ]
    
});