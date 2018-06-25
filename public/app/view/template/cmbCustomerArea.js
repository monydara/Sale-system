Ext.define('App.view.template.cmbCustomerArea',{
    extend: 'Ext.form.field.ComboBox',
    alias:'widget.cmbCustomerArea',
    name:'customer_area_id',
    store:'combo.Area',
    valueField:'id',
    displayField:'name',
    queryMode:'remote',
    minChars:2,
    autoSelect: true,
    allowBlank:false,
    selectOnFocus:true,
    fieldLabel:'Customer Area'
});
