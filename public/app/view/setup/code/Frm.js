Ext.define('App.view.setup.code.Frm', {
    extend:'Ext.window.Window',
    alias:'widget.frmCode' ,	       
    modal:true,
    title:'Code Form',
    buttons:[
        '->',

        {
            xtype:'cBtnSave'
        },{
            xtype:'cBtnCancel'
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
                    readOnly:true, 
                    name:'n_type',
                    fieldLabel:'Code Type'
                },{
                    xtype:'textfield',
                    name:'prefix',
                    allowBlank:true,
                    fieldLabel:'Prefix'
                } ,{
                    xtype:'numberfield',
                    name:'next_code',
                    fieldLabel:'Next Code'
                } ,{
                    xtype:'numberfield',
                    name:'degit',
                    fieldLabel:'Degit'
                },{
                    xtype:'checkbox',
                    name:'is_manaul',
                    fieldLabel:'Is Manaul',
                    checkedValue:true ,
                    uncheckedValue:false
                }
            ]
        }
    ]

});