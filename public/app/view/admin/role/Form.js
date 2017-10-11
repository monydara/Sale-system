
Ext.define('App.view.admin.role.Form', {
    extend:'Ext.window.Window',
    alias:'widget.roleForm' ,
    bodyPadding:20 ,
    border:true,
    title:'Role Form',
    modal:true ,
    buttons:[

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
            layout:{
                type:'table',
                columns:2
            },
            defaults:{
                width:350,
                style:'margin-left:5px',
            },
            items:[
                {
                    xtype:'textfield',
                    name:'name',
                    allowBlank:false,
                    fieldLabel:'Role',
                    colspan:2,
                    width: 500,
                },{
                    xtype:'checkbox',
                    name:'is_active',
                    fieldLabel:'Is Active',
                    inputValue: 1,
                    style:'margin-left:120px',
                    width: 50
                },{
                    xtype:'checkbox',
                    name:'is_admin',
                    fieldLabel:'Is Admin',
                    inputValue: 1,
                    width: 50
                },{
                    xtype:'textarea',
                    name:'description',
                    colspan:2 ,
                    width: 500,
                    fieldLabel:'Description'
                }

            ]
        }

    ]




});
