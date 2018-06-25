Ext.define('App.view.sale.saleReceipt.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.saleReceiptIndex',

    border: true,
    layout: 'card',
    initComponent: function() {
        Ext.apply(this, {
            items: [

                {
                    title: '<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Sale Receipt List</font>',
                    tools: [{
                       xtype:'cTxtSearch'
                    }, {
                       xtype:'cBtnAdd'
                        },{
                            xtype:'cBtnEdit'
                        },  {
                            xtype: 'cBtnDelete',
                            action: 'VoidInvoice',

                        }, {
                            xtype: 'cBtnPrint'

                        }
                    ],
                    xtype: 'grid',
                    border: true,
                    name: 'index',
                    store: 'sale.SaleReceipt',
                    columns: [{
                        header: 'NO',
                        xtype: 'rownumberer',
                        width: 50,
                        align: 'center'
                    },

                        {
                            header: 'Invoice No ',
                            width: 150,
                            dataIndex: 'invoice_no'
                        }, {
                            header: 'Date',
                            width: 150,
                            dataIndex: 'date'
                        }, {
                            header: 'Customer Name',
                            flex: 1,
                            dataIndex: 'customer_name'
                        }, {
                            header: 'Contact Name',
                            flex: 1,
                            dataIndex: 'contact_person_name'
                        }, {
                            header: 'Amount',
                            width: 150,
                            dataIndex: 'grand_total_amount',
                            renderer: function(value ){
                                return Ext.util.Format.currency(value , App.store.Config.defaultCurrencySymbol, 2 )
                            }
                        },

                    ],
                    bbar:{
                        xtype:'cPaging',
                        store: 'sale.SaleReceipt',
                    }


                }, {
                    xtype: 'saleReceiptForm'
                }
            ]
        });
        this.callParent(arguments);
    },



});