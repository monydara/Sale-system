Ext.define('App.view.template.cmbCurrency',{
    extend: 'Ext.form.field.ComboBox',
    alias:'widget.cmbCurrency',

    emptyText: '-- Select Currency --',
    store:'combo.Currency',
    valueField:'id' ,
    displayField:'name',
    fieldLabel:'Currency',
    name:'currency_id',
    minChars: 2,
    editable:false ,
    forceSelection:true
});
