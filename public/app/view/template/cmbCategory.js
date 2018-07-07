Ext.define('App.view.template.cmbCategory',{
    extend: 'Ext.form.field.ComboBox',
    alias:'widget.cmbCategory',
    emptyText:'-- Category Name --',
    displayField: 'name',
    store: 'combo.ItemCategory',
    valueField: 'id',
    name: 'category_id',
    minChars: 2,
    queryMode: 'remote',
    typeAhead: true,
    fieldLabel:'Category',
    triggerAction: 'all',
});
