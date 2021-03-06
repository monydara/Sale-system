Ext.define('App.view.setup.menu.Frm', {
    extend:'Ext.window.Window',
    alias:'widget.frmMenu' ,
    modal:true,
    title:'Menu Form',
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
                    name:'menu',
                    fieldLabel:'Menu Name'
                },{
                    xtype:'textfield',
                    name:'icon_cls',
                    fieldLabel:'Icon Class'
                },{
                    xtype:'checkbox',
                    name:'is_leaf',
                    fieldLabel:'Is Leaf'

                },{
                    xtype:'checkbox',
                    name:'is_active',
                    fieldLabel:'Is Active'

                },{
                    xtype:'combo',
                    name:'parent_id',
                    allowBlank:true ,
                    fieldLabel:'Parent',
                    valueField: 'id' ,
                    displayField:'menu',
                    store:'combo.Menu'
                },{
                    xtype:'textfield',
                    name:'view_index',
                    allowBlank:true ,
                    fieldLabel:'View Index'
                },{
                    xtype:'textfield',
                    name:'controller_name',
                    allowBlank:true ,
                    fieldLabel:'Controller'
                },{
                    xtype:'numberfield',
                    name:'seq_no',
                    fieldLabel:'Seq No.',
                }
            ]
        }
    ]

});
