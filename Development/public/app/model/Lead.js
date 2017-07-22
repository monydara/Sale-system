Ext.define('App.model.Lead', {
    extend: 'Ext.data.Model',
    fields: [
		"id",
		"name",
		"legal_name",
		"industry",
		"lead_area_id",
		"phone",
		"email",
		"mobile",
		"website",
		"address",
		"status",
		"source",
		"lead_owner",
		"next_contact_by",
		"next_contact_date",
		"contact_id",
		"lead_purpose",

		"status_name",
		"leadowner",
		"source_name",
		"username"
    ]

});
