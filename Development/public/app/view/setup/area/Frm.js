Ext.define('App.view.setup.area.Frm', {
    extend:'Ext.window.Window',
    alias:'widget.frmArea' ,	       
    modal:true,
    title:'Area Form',
    buttons:[
        '->',

        {
            text:'Save',
            iconCls:'icon-save',
            action:'Save'
        },{
            text:'Cancel',
            action:'Cancel',
            iconCls:'icon-cancel'
        }
    ],
    items:[
        {
            xtype:'form',
            bodyPadding: 20 , 
            defaults:{
                allowBlank:false,
                width: 400
            },
            items:[
                {
                    xtype:'textfield',
                    name:'code',
                    fieldLabel:'Code'
                },{
                    xtype:'textfield',
                    name:'name',
                    fieldLabel:'Name'
                }
            ]
        }
    ]

});