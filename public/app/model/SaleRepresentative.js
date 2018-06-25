Ext.define('App.model.SaleRepresentative', {
	extend: 'Ext.data.Model',
	fields: [
		"id",
		"first_name",
		"last_name",
		"mobile",
		"phone",
		"email",
		"address",
		"remark",
		"status",
		"register_date", 
		"position_id",
		{
			name: 'name',
			convert: function(v, rec) {
				var custom = rec.get('first_name') + " " + rec.get("last_name");
				return custom;
			}
		}
	]

});