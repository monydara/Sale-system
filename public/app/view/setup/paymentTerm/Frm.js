Ext.define('App.view.setup.paymentTerm.Frm', {
    extend:'Ext.window.Window',
    alias:'widget.frmPaymentTerm' ,
    modal:true,
    title:'Payment Term Form',
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
                    name:'payment_term_name',
                    fieldLabel:'Payment Term'+redStar,
                    allowBlank:false,
                },{
                    xtype:'textarea',
                    name:'payment_term_description',
                    fieldLabel:'Description'+redStar,
                    height:300,
                    allowBlank:false
                }
            ]
        }
    ]

});
