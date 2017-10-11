Ext.define('App.view.item.um.FmUM', {
    extend:'Ext.window.Window',
    alias:'widget.FormUM' ,	       
    modal:true,
    title:'UM',
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
            xtype: 'form',
            bodyPadding: 10,
            defaults:{
                    // allowBlank:false,
                    width: 400
            },

            items:[
                {
                    xtype: 'textfield',
                    name: 'code',
                    fieldLabel: 'Code',
                },
                {
                    xtype: 'textfield',
                    name: 'name',
                    fieldLabel: 'Name',
                },
                {
                    xtype: 'textfield',
                    name: 'abbreviation',
                    fieldLabel: 'Abbreviation',
                },
                {
                    xtype: 'textarea',
                    name: 'remark',
                    fieldLabel: 'Remark',
                }
                
            ]
        }
    ]

});