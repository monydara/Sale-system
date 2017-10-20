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
                        fieldLabel: 'Search',
                        xtype: 'textfield',
                        name: 'Search',
                        labelAlign: 'right',
                        width: 300,
                        emptyText: '-- Search Invoice --'
                    },
                        // '->',
                        {
                            action: 'Add',
                            xtype: 'button',
                            style: 'margin-left:5px',
                            iconCls: 'icon-add',
                            tooltip: 'Add New Invoice'
                        },{
                            action: 'Edit',
                            xtype: 'button',
                            style: 'margin-left:5px',
                            iconCls: 'icon-edit',
                            tooltip: 'Edit Invoice'
                        },  {
                            xtype: 'button',
                            style: 'margin-left:5px',
                            action: 'VoidInvoice',
                            tooltip: 'Void This Invoice',
                            iconCls: 'icon-delete'
                        }, {
                            xtype: 'button',
                            iconCls: 'icon-printer',
                            action:'Print',
                            tooltip: 'Print Invoice',
                            style: 'margin-left:5px',

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
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store: 'sale.SaleReceipt',
                        displayInfo: true,
                        displayMsg: 'view {0} - {1} of {2}',
                        emptyMsg: "view 0"
                    })

                }, {
                    xtype: 'saleReceiptForm'
                }
            ]
        });
        this.callParent(arguments);
    },



});