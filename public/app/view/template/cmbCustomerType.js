Ext.define('App.view.template.cmbCustomerType',{
    extend: 'Ext.form.field.ComboBox',
    alias:'widget.cmbCustomerType',
    name:'customer_type_id',
    store:'combo.CustomerType',
    valueField:'id',
    displayField:'name',
    queryMode:'remote',
    minChars:2,
    autoSelect: true,
    allowBlank:false,
    selectOnFocus:true,
    fieldLabel:'Customer Type'
});
