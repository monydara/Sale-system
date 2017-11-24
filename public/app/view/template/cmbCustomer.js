Ext.define('App.view.template.cmbCustomer',{
    extend: 'Ext.form.field.ComboBox',
    alias:'widget.cmbCustomer',
    fieldLabel: 'Customer ',
    allowBlank: false,
    emptyText: '-- Select Customer --',
    store: 'combo.Customer',
    valueField: 'id',
    queryMode:'remote',
    minChars: 2,
    displayField: 'name',
    name: 'customer_id',
    forceSelection:true,
})