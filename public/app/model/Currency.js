Ext.define('App.model.Currency', {
    extend: 'Ext.data.Model',
    fields: [
        'id',
        'name',
        'symbol',
        'abbr',
        'fraction_unit',
        'rate_in',
        'rate_out',
        'is_base',
        'created_at',
        'updated_at',

    ]

});
