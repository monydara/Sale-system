Ext.define('App.view.template.cmbItem',{
    extend: 'Ext.form.field.ComboBox',
    alias:'widget.cmbItem',
    emptyText:'-- Item Name/Code --',
    displayField: 'name',
    store: 'combo.Item',
    valueField: 'id',
    name: 'item_id',
    minChars: 2,
    queryMode: 'remote',
    typeAhead: true,
    fieldLabel:'Item',
    triggerAction: 'all',
});
