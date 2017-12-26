Ext.define('App.view.template.cmbBrand',{
    extend: 'Ext.form.field.ComboBox',
    alias:'widget.cmbBrand',
    fieldLabel: 'Brand ',
    allowBlank: true,
    emptyText: '-- Select Brand --',
    store: 'combo.Brand',
    valueField: 'id',
    queryMode:'remote',
    minChars: 2,
    displayField: 'name',
    name: 'brand_id',
    forceSelection:true,
})