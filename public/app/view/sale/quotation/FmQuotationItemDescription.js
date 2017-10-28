Ext.define('App.view.sale.quotation.FmQuotationItemDescription', {
    extend:'Ext.window.Window',
    alias:'widget.frmDescription' ,
    modal:true,
    title:'Quotation Item Description',
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
            defaultType:"textarea",
            height: 500,
            width: 700,
            defaults:{
                width: 600,
                height: 450
            },
            items:[
                {
                    fieldLabel:'Description'+redStar,
                    name:'description',
                    allowBlank:false
                },
                
            ]
        }
    ]

});
