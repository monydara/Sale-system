Ext.define('App.view.template.cmbInvoice',{
    extend: 'Ext.form.field.ComboBox',
    alias:'widget.cmbInvoice',
    emptyText:'-- Invoice No --',
    displayField: 'invoice_no',
    store: 'combo.Invoice',
    valueField: 'id',
    name: 'invoice_id',
    minChars: 2,
    queryMode: 'remote',
    typeAhead: true,
    fieldLabel:'Invoice',
    triggerAction: 'all',
});
