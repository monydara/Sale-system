// ---- button add
Ext.define('App.view.custom.ButtonAdd',{
    extend: 'Ext.button.Button',
    alias:'widget.cBtnAdd',
    action:'Add',
    style:'margin-left:5px',
    iconCls:'icon-add',
    tooltip:'Add New Record'
})


// ---- button Edit
Ext.define('App.view.custom.ButtonEdit',{
    extend: 'Ext.button.Button',
    alias:'widget.cBtnEdit',
    action:'Edit',
    style:'margin-left:5px',
    iconCls:'icon-edit',
    tooltip:'Edit Record'
})

//----- button save
Ext.define('App.view.custom.ButtonSave',{
    extend: 'Ext.button.Button',
    alias:'widget.cBtnSave',
    text:'Save',
    iconCls:'icon-save',
    action:'Save',
    tooltip:'Save Record'
})

//----- button save
Ext.define('App.view.custom.ButtonCancel',{
    extend: 'Ext.button.Button',
    alias:'widget.cBtnCancel',
    text:'Cancel',
    action:'Cancel',
    iconCls:'icon-cancel',
    //tooltip:'Cancal All Change'
})

//-- button Print
Ext.define('App.view.custom.ButtonPrint',{
    extend: 'Ext.button.Button',
    alias:'widget.cBtnPrint',
    iconCls:'icon-printer',
    style:'margin-left:5px',
    action:'Print',
    tooltip:'Print'
})

//-- button delete

Ext.define('App.view.custom.ButtonDelete',{
    extend: 'Ext.button.Button',
    alias:'widget.cBtnDelete',
    style: 'margin-left:5px',
    action: 'Delete',
    tooltip: 'Delete Record',
    iconCls: 'icon-delete'
})
