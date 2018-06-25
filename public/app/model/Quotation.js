Ext.define('App.model.Quotation', {
    extend: 'Ext.data.Model',
    fields: [
			{name:"id" , type:'int'},
			"sale_quotation_no",
			"date",
			"expire_date",
			"ref_no",
			"contact_person_name",
			"phone",
			"payment_term",
			"sale_representative_id",
			"note",
			"total_amount",
			"tax_percentag",
			"tax_amount",
			"grand_total_amount",
			"memo",
			"status",
			"created_by",
			"modify_by",
			"sale_quotation_detail_attributes",

			"customer_id",
			"lead_id",
			"payment_term_id",
			"quotation_to",

    ],


});
