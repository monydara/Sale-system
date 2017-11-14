
//-- custom field set with layout
Ext.define('App.view.custom.FieldSet', {
    extend:'Ext.form.FieldSet',
    alias:'widget.cFieldSet',
    autoScroll: true,
    title: '<b> FieldSet </b>',
    padding: 10,
    layout: {
        type: 'table',
        columns: 2
    },
    defaults: {
        width: '95%',
        style: 'margin-left: 10px'
    },
})