Ext.define('App.view.item.location.FmLocation', {
    extend:'Ext.window.Window',
    alias:'widget.FormLocation' ,	       
    modal:true,
    title:'Location',
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
                    name: 'name',
                    fieldLabel: 'Name',
                },
                {
                    xtype: 'textfield',
                    name: 'phone',
                    fieldLabel: 'Phone',
                },
                {
                    xtype: 'textfield',
                    name: 'fax',
                    fieldLabel: 'Fax',
                },
                {
                    xtype: 'textfield',
                    name: 'email',
                    fieldLabel: 'Email',
                },
                {
                    xtype: 'textfield',
                    name: 'website',
                    fieldLabel: 'Website'
                },
                {
                    xtype: 'textfield',
                    name: 'address',
                    fieldLabel: 'Address'
                },
                {
                    layout: 'hbox',
                    xtype: 'container',
                    items:[
                        {
                            xtype: 'radiofield',
                            name: 'is_active',
                            fieldLabel: 'Status',
                            checked:true, 
                            inputValue:true ,
                            boxLabel:'<span style="color:blue ; font-weight:bold">Active </span>'
                        },{
                            style: 'margin-left:10px',
                            xtype: 'radiofield',
                            name: 'is_active',
                            inputValue:false ,

                            boxLabel:'<span style="color:red ; font-weight:bold">Deactive </span>'
                        }
                    ]
                    
                },
                {
                    xtype: 'textarea',
                    name: 'remark',
                    fieldLabel: 'Remark'
                }
                
            ]
        }
    ]

});