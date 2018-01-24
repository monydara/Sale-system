Ext.define('App.view.template.cmbCustomPrice',{
    extend: 'Ext.form.field.ComboBox',
    alias:'widget.cmbCustomPrice',
    name:'custom_price_id' ,
    store:'combo.CustomPrice',
    valueField:'id',
    displayField:'name',
    fieldLabel:'Custom Price',
    queryMode:'remote',
    minChars:2,
    autoSelect: true,
    allowBlank:false,
    selectOnFocus:true,
});
