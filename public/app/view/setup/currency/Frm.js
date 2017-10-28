Ext.define('App.view.setup.currency.Frm', {
    extend:'Ext.window.Window',
    alias:'widget.frmCurrency' ,
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
                    fieldLabel:'Fraction Unit',

                },
                {
                    xtype:'numberfield',
                    name:'rate_in',
                    minValue:1,
                    fieldLabel:'Rate In( <b>'+App.store.Config.defaultCurrencySymbol+' </b>)'
                },
                {
                    xtype:'numberfield',
                    name:'rate_out',
                    minValue:1,
                    fieldLabel:'Rate Out( <b>'+App.store.Config.defaultCurrencySymbol+'</b> )'
                },{
                    xtype:'panel',
                    html:'<b>Note: </b> <p> This form is use for exchange rate.<br> Example. you want set up one'+
                    ' more currency is Dollar and your default currency is Riel.<b> Fraction Unit = 1$ </b> and <b>Rate In : 4100 </b> mean your exchange is 1$ = 4100 Riel   </p>'
                }
            ]
        }
    ]

});
