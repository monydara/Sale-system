Ext.define('App.view.setup.currency.Frm', {
    extend:'Ext.window.Window',
    alias:'widget.frmCurrency' ,
    modal:true,
    title:'Menu Form',
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
                    name:'name',
                    fieldLabel:'Currency Name'
                },{
                    xtype:'textfield',
                    name:'symbol',
                    maxLenght: 1 ,
                    fieldLabel:'Symbol'
                },{
                    xtype:'textfield',
                    name:'abbr',
                    maxLenght: 3 ,
                    fieldLabel:'Abbriviation'
                },
                {
                    xtype:'numberfield',
                    name:'fraction_unit',
                    minValue:1,
                    fieldLabel:'Fraction Unit'
                },
                {
                    xtype:'numberfield',
                    name:'rate_in',
                    minValue:1,
                    fieldLabel:'Rate In'
                },
                {
                    xtype:'numberfield',
                    name:'rate_out',
                    minValue:1,
                    fieldLabel:'Rate Out'
                },
            ]
        }
    ]

});
