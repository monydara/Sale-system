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
    initComponent:function () {

        var me = this;
        Ext.apply(me,{
            items:[
                me.getVHeader ,
                me.getVBasicPayment ,
                {
                    xtype:'customerPaymentPaymentFieldSet'
                },
                me.getGridPaymentDetail,
                {
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
                        width: 350,
                        defaults: {
                            labelAlign: 'right',
                            labelWidth:150
                        },
                        items:me.getVFooter()
                    }]
                }

            ]


        });
        this.callParent(arguments);

    },
    getVBasicPayment:{
        xtype: 'cFieldSet',

            title: '<b> Basic Info </b>',

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
    },
    getVHeader: {
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
    },
    getGridPaymentDetail:{
        xtype: 'grid',
        border: true,
        autoScroll: true,
        height: 300,
        style: 'border:1px solid silver',
        plugins: Ext.create('Ext.grid.plugin.CellEditing', {
            clicksToEdit: 1
        }),
        selModel: {
            selType: 'cellmodel'
        },
        store: 'sale.CustomerPaymentDetail',
        features: [{ ftype: 'grouping' }],
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
            header:'Invoice Amount',
            dataIndex:'invoice_amount',
            renderer:function (value, field ) {
                return App.conf.GlobalFn.currencyFormat(value , field.record.data.currency_id);
            },
            width:150

        },{
            header:'Unpaid Amount',
            dataIndex:'unpaid_amount',
            renderer:function(value  , field , record){
                return App.conf.GlobalFn.currencyFormat(value , field.record.data.currency_id);
            },
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
            renderer:function(value  , field , record){
                return App.conf.GlobalFn.currencyFormat(value , field.record.data.currency_id);
            },
            width:100
        },{
            header:'Balance',
            renderer:function(value  , field , record){
                return App.conf.GlobalFn.currencyFormat(value , field.record.data.currency_id);
            },
            flex: 1,
            dataIndex:'balance'
        }
        ]
    },
    getVFooter: function(){

        var Citems=[];
        App.store.Config.allCurrency.forEach(function(currency){
            Citems.push({
                xtype:'displayfield',
                value: 0 ,
                name:'total_currency_'+currency.id,
                fieldLabel:"Total Pay( "+currency.name+" ): ",
                renderer:function(value){
                    return App.conf.GlobalFn.currencyFormat(value , currency.id);
                }
            })

        })
        Citems.push({
            xtype:'hidden',
            name:'total_amount'
        })
       return Citems;

    }


});