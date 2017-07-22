Ext.define('App.view.sale.contact.Frm', {
    extend:'Ext.window.Window',
    alias:'widget.frmContact' ,
    modal:true,
    title:'Contact Form',
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
            defaultType:"textfield",
            defaults:{
                width: 400
            },
            items:[
                {
                    name:'contact_name',
                    fieldLabel:'Contact Name'+redStar,
                    allowBlank:false
                },
                {
                    name:'contact_mobile',
                    fieldLabel:'Contact Mobile'+redStar,
                    allowBlank:false

                },{
                    name:'contact_id_card',
                    fieldLabel:'Contact Id Card'
                },{
                    name:'contact_email',
                    vtype:'email',
                    fieldLabel:'Contact Email'
                },{
                    name:'contact_address',
                    fieldLabel:'Address'
                }
            ]
        }
    ]

});
