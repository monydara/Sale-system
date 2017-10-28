Ext.define('App.view.sale.customerPayment.Frm', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FormCustomerPayment',
    bodyPadding: 20,
    border: true,
    autoScroll: true,
    buttons: [
        '->',

        {
           xtype:'cBtnSave'
        }, {
            xtype:'cBtnCancel'
        }
    ],
    items: [

        {
            xtype: 'container',
            layout: 'hbox',
            items: [{
                xtype: 'container',
                flex: 1,
                html: '<u>Customer Payment</u>',
                cls: 'title_form'

            }, {
                xtype: 'container',
                width: 350,
                defaults: {
                    labelAlign: 'right',
                    width: 350
                },
                items: [{
                    xtype: 'textfield',
                    name: 'receipt_no',
                    emptyText: 'Receipt No.',
                    allowBlank: false,
                    readOnly: true,
                    fieldLabel: 'Receipt No.<span style="color:red">*</span>',
                }, {
                    xtype: 'datefield',
                    fieldLabel: 'Date<span style="color:red">*</span>',
                    allowBlank: false,
                    emptyText: 'DD-MM-YYYY',
                    name: 'date',
                    value: new Date(),
                    format: 'd-m-Y',
                    submitFormat: 'Y-m-d'
                }]
            }]
        }, {
            xtype: 'fieldset',
            autoScroll: true,
            title: '<b> Basic Info </b>',
            padding: 10,
            layout: {
                type: 'table',
                columns: 2
            },
            defaults: {
                width: 400,
                style: 'margin-left: 10px'
            },
            items: [{
                    xtype: 'combo',
                    fieldLabel: 'Customer(<span style="color:red">*</span>)',
                    allowBlank: false,
                    emptyText: '-- Select Customer --',
                    store: 'combo.Customer',
                    valueField: 'id',
                    queryMode:'local',
                    // editable: false,
                    displayField: 'name',
                    name: 'customer_id'
                }, {
                    xtype:'combo', 
                    name:'payment_type', 
                    fieldLabel:'Payment Type', 
                    valueField:'id', 
                    displayField:'name',
                    editable:false , 
                    value:'CA',
                    store:Ext.create("Ext.data.Store",{
                        fields:['id', 'name'],
                        data:[
                            {id:'CA', name:'Cash'},
                            {id:'CH', name:'Cheque'},
                        ]
                    })
                },{
                    xtype: 'textfield',
                    fieldLabel: 'Ref No.',
                    name: 'ref_no',
                },{
                  xtype:'textfield',
                  fieldLabel:'Cheque No',
                  hidden:true,
                  name:'check_no',
                  maxLength : 10 ,
                  emptyText:'-- Cheque Number --- '  
                },

            ]
        }, {
            xtype: 'grid',
            border: true,
            autoScroll: true,
            height: 200,
            style: 'border:1px solid silver',
            plugins: Ext.create('Ext.grid.plugin.CellEditing', {
                clicksToEdit: 1
            }),
            selModel: {
                selType: 'cellmodel'
            },
            store: 'sale.CustomerPaymentDetail',
            title: 'Invoice Item',
            tools: [{
                xtype: 'textfield',
                name: 'invoiceNo',
                emptyText: 'Invoice No'
            }, {
                xtype: 'button',
                style: 'margin-left:10px',
                action: 'AddItem',
                tooltip: 'Add Invoice To List',
                iconCls: 'icon-add'

            },{
                style: 'margin-left:10px',
                xtype:'button',
                action:'payAll',
                text:'Pay All'
            }],
            columns: [{
                header: 'No.',
                xtype: 'rownumberer',
                align: 'center',
                width: 50
            },{
                header:'Invoice No.',
                dataIndex:'invoice_no',
                width:150
            },{
                header:'Invoice Amount',
                dataIndex:'invoice_amount',
                renderer: Ext.util.Format.usMoney,
                width:150

            },{
                header:'Unpaid Amount',
                dataIndex:'unpaid_amount',
                renderer: Ext.util.Format.usMoney,
                width:150 ,
            },{
                header:'Description',
                dataIndex:'description',
                width:300,
                field:{
                    xtype:'textarea'
                }
            },{
                header:'Pay',
                dataIndex:'amount',
                field:{
                    xtype:'numberfield',
                    minValue:0 
                },
                renderer: Ext.util.Format.usMoney,
                width:100 
            },{
                header:'Balance',
                renderer: Ext.util.Format.usMoney,
                flex: 1,
                dataIndex:'balance'
            }
            ]
        }, {
            xtype: 'container',
            layout: 'hbox',
            style: 'margin-top:10px',
            items: [{
                xtype: 'container',
                flex: 1,
                defaults: {
                    width: 400
                },
                items: [{
                    xtype: 'textarea',
                    name: 'memo',
                    fieldLabel: 'Memo',
                    width: 600,
                    height: 100,
                }]
            }, {
                xtype: 'container',
                width: 300,
                defaults: {
                    labelAlign: 'right'
                },
                items: [
                    {
                        xtype:'hiddenfield',
                        name:'total_amount'
                    },{
                        xtype: 'displayfield',
                        fieldLabel: 'Total Amount($)',
                        name: 'total_amount',
                        value: '0.00'
                    }

                ]
            }]
        }

    ]



});