Ext.define('App.view.template.txtDate',{
  alias:'widget.txtDate',
    extend: 'Ext.form.field.Date',
    fieldLabel: 'Date',
    emptyText: 'DD-MM-YYYY',
    name: 'date',
    format: 'd-m-Y',
    submitFormat: "Y-m-d"
});
