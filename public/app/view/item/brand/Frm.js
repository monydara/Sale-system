Ext.define('App.view.item.brand.Frm', {
    extend:'Ext.window.Window',
    alias:'widget.frmBrand' ,
    modal:true,
    title:'Brand Form',
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
                    name:'name',
                    fieldLabel:'Name'
                },{
                    xtype:'textfield',
                    name:'description',
                    fieldLabel:'Description'
                }
            ]
        }
    ]

});