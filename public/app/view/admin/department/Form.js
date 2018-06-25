
Ext.define('App.view.admin.department.Form', {
    extend:'Ext.window.Window',
    alias:'widget.departmentForm' ,
    bodyPadding:20 ,
    border:true,
    title:'Department Form',
    modal:true ,
    buttons:[

        {
         xtype:'cBtnSave'
        },{
            xtype:'cBtnCancel'
        }
    ],

    items:[
        {
            xtype:'form',

            defaults:{
                width:350,
                style:'margin-left:5px',
            },
            items:[
                {
                    xtype:'textfield',
                    name:'name',
                    allowBlank:false,
                    fieldLabel:'Department'
                },{
                    xtype:'textarea',
                    name:'description',
                    fieldLabel:'Description'
                }

            ]
        }

    ]




});
