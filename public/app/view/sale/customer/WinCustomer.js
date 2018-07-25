Ext.define('App.view.sale.customer.WinCustomer', {
    extend: 'Ext.window.Window',
    alias: 'widget.FormCustomer',
    bodyPadding: 20,
    border: true,
    autoScroll: true,
    title: 'Custmer Form',
    width: 500,

    buttons: [
        '->',

        {
            xtype: 'cBtnSave',
            action: 'SaveWin'
        }, {
            xtype: 'cBtnCancel',
            action: 'CancelWin'
        }
    ],
   
    items:[
        {
             xtype:'cFieldSet',
            title:'Customer Info',
           
            defaultType:'textfield',
            items:[
                {
                    xtype:'combo',
                    name:'lead_id',
                    store:'combo.Lead',
                    valueField:'id',
                    displayField:'code',
                    fieldLabel:'From Lead',
                    queryMode:'remote',
                    minChars:2,
                    emptyText:'Type Lead Code Here',
                    tooltip:'Convert lead to customer',
                    colspan:2

                },
                {
                    name:'name',
                    allowBlank:false,
                    fieldLabel:'Customer Name'+redStar
                },{
                    name:'legal_name',
                    allowBlank:true,
                    fieldLabel:'Legal Name'
                },{
                    xtype:'cmbCustomerType',
                    allowBlank:true ,
                },{
                  xtype:'cmbCustomPrice' ,
                  allowBlank:true ,
                   listeners:Util.firstSelect(),
                },{
                    xtype:'cmbCustomerArea',
                     listeners:Util.firstSelect(),
                     allowBlank:true,
                    fieldLabel:'Customer Area'
                },{
                    name:'vat_tin',
                    fieldLabel:"VAT TIN"
                },{
                    name:'phone',
                    fieldLabel:'Phone'
                },{
                    name:'mobile',
                    fieldLabel:'Mobile'
                },{
                    name:'email',
                    vtype:'email',
                    fieldLabel:'Email'
                },{
                    name:'website',
                    fieldLabel:'Website'
                },{
                    xtype:'textarea',
                    name:'address',
                    fieldLabel:'Address',
                    colspan: 2,
                    // flex:1,
                    // width:'98%',

                    
                },
            ]
        },
        {
            xtype:'cFieldSet',
            title:'Contact Info',
           
            defaultType:'textfield',
            items:[
                {
                    xtype:'container',
                    layout:'hbox',
                    items:[
                        {
                            name:'contact_id',
                            xtype:'combo',
                            store:'combo.Contact',
                            valueField:'id',
                            minChars:2,
                            allowBlank:true ,
                            width:375 ,
                            queryMode:'remote',
                            displayField:'contact_name',
                            fieldLabel:'Contact Name'
                        },{
                            xtype:'button',
                            action:'AddContact',
                            iconCls:'icon-add',
                            tooltip:'Add new Contact'
                        }
                    ],

                },{
                    name:'contact_mobile',
                    fieldLabel:'Contact Mobile'
                },{
                    name:'contact_id_card',
                    fieldLabel:'Contact Id Card'
                },{
                    name:'contact_email',
                    fieldLabel:'Contact Email'
                },{
                    name:'contact_address',
                    fieldLabel:'Address'
                }

            ]
        }

    ]
});
