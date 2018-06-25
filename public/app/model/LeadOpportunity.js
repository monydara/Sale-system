Ext.define('App.model.LeadOpportunity', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"code",
		"oppunity_type",
		"oppunity_to",
		"status_id",
		"customer_id",
		"lead_id",
		"contact_id",
		"source_id",
		"next_contact_by",
		"next_contact_date",
		"to_discuss",
		"is_with_item",
		"next_contact_by_name"
    ]

});
