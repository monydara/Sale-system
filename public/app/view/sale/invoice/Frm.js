Ext.define('App.view.sale.invoice.Frm', {
    extend: 'Ext.form.Panel',
    alias: 'widget.invoiceForm',
    bodyPadding: 20,
    border: true,
    autoScroll: true,

    buttons: [
        '->',

        {
            xtype: 'cBtnSave'
        }, {
            xtype: 'cBtnCancel'
        }
    ],
    initComponent: function () {
        Ext.apply(this, {
            items: [

                {
                    xtype: 'container',
                    layout: 'hbox',
                    items: [{
                        xtype: 'container',
                        flex: 1,
                        html: '<u>Invoice</u>',
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
                            name: 'invoice_no',
                            emptyText: 'Invoice Number',
                            allowBlank: false,
                            readOnly: true,
                            fieldLabel: 'Invoice No.<span style="color:red">*</span>',
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
                    xtype: 'cFieldSet',
                    //   autoScroll: true,
                    title: '<b> Basic Info </b>',
                    //   padding: 10,
                    //   layout: {
                    //       type: 'table',
                    //       columns: 2
                    //   },
                    //   defaults: {
                    //       width: 400,
                    //       style: 'margin-left: 10px'
                    //   },
                    items: [
                        {

                            xtype: 'combo',
                            fieldLabel: 'From Quotaion',
                            name: 'sale_quotation_id',
                            valueField: 'id',
                            forceSelection: true,
                            displayField: 'sale_quotation_no',
                            store: 'combo.Quotation',
                            queryMode: 'remote',
                            minChars: 2,
                            emptyText: '-- Quotation Code --',
                            // width: 400,


                        }, {
                            xtype: 'cmbCustomer',
                            // xtype: 'combo',
                            fieldLabel: 'Customer(<span style="color:red">*</span>)',
                            // allowBlank: false,
                            // emptyText: '-- Select Customer --',
                            // store: 'combo.Customer',
                            //  forceSelection:true,
                            // valueField: 'id',
                            // // editable: false,
                            // displayField: 'name',
                            //  minChars: 2,
                            // name: 'customer_id'
                        }, {
                            xtype: 'textfield',
                            fieldLabel: 'Ref No.',
                            name: 'ref_no',
                        }, {
                            xtype: 'displayfield',
                            name: 'custom_price',
                            readOnly: true,
                            fieldLabel: 'Custom Price'
                        }, {
                            xtype: 'datefield',
                            fieldLabel: 'Due Date',
                            name: "due_date",
                            value: new Date(),
                            format: 'd-m-Y',
                            submitFormat: 'Y-m-d'
                        },

                    ]
                }, {
                    xtype: 'grid',
                    border: true,
                    autoScroll: true,
                    height: 400,
                    style: 'border:1px solid silver',
                    plugins: Ext.create('Ext.grid.plugin.CellEditing', {
                        clicksToEdit: 1
                    }),
                    selModel: {
                        selType: 'cellmodel'
                    },
                    store: 'sale.InvoiceDetail',
                    title: 'Invoice Item',
                    tbar: this.getTbar(),

                    tools: [

                        {
                            xtype: 'combo',
                            name: 'txtItem',
                            valueField: 'id',
                            displayField: 'name',
                            store: Ext.create('App.store.combo.Item'),
                            emptyText: 'Code or Name',
                            queryMode: 'remote',
                            minChars: 2,
                        }, {
                            xtype: 'button',
                            style: 'margin-left:10px',
                            action: 'AddItem',
                            tooltip: 'Add Qutoation Item',
                            iconCls: 'icon-add'

                        }],
                    columns: [{
                        header: 'No.',
                        xtype: 'rownumberer',
                        align: 'center',
                        width: 50
                    }, {
                        //     header: 'Code',
                        //     dataIndex: 'code',
                        //     width: 100,
                        //     editor: {
                        //         xtype: 'combo',
                        //         displayField: 'code',
                        //         valueField: 'code',
                        //         store: 'combo.Item',
                        //         name: 'code',
                        //         queryMode: 'local',
                        //         typeAhead: true,
                        //         triggerAction: 'all',
                        //         listeners: {
                        //             select: function(combo, record, index) {
                        //                 var rec = record[0];
                        //                 App.app.getController("sale.Invoice").itemRecord = rec;
                        //
                        //             }
                        //         },
                        //     }
                        //
                        // }, {
                        header: 'Item',
                        dataIndex: 'item_name',
                        flex: 1,
                        editor: {
                            xtype: 'combo',
                            displayField: 'name',
                            store: 'combo.Item',
                            valueField: 'name',
                            name: 'name',
                            queryMode: 'local',
                            typeAhead: true,
                            triggerAction: 'all',
                            listeners: {
                                select: function (combo, record, index) {
                                    var rec = record[0];
                                    App.app.getController("sale.Invoice").itemRecord = rec;

                                }
                            },
                        }
                    },

                    {
                        header: 'UM',
                        dataIndex: 'um',
                        width: 70,
                        editor: {
                            xtype: 'combo',
                            store: 'combo.ItemPrice',
                            valueField: 'um',
                            displayField: 'um',
                            queryMode: 'local',
                            typeAhead: true,
                            triggerAction: 'all',
                            listeners: {
                                select: function (combo, record, index) {
                                    var rec = record[0];
                                    App.app.getController("sale.Invoice").umRecord = rec;

                                }
                            },
                        }

                    }, {
                        header: 'Qty',
                        dataIndex: 'qty',
                        width: 50,
                        field: {
                            xtype: 'numberfield',
                            name: 'qty',
                            minValue: 0
                        }

                    }, {
                        header: 'Price',
                        dataIndex: 'price',
                        // renderer: 'usMoney',
                        renderer: function (value, a, rec) {

                            // return value + rec.get("currency_symbol");
                            return App.conf.GlobalFn.currencyFormat(value, rec.get("currency_id"));
                        },
                        width: 120,
                        field: {
                            xtype: 'numberfield',
                            name: 'price',
                            minValue: 0
                        },


                    }, {
                        header: 'Dis(%)',
                        dataIndex: 'dis_percentage',
                        // renderer: 'usMoney',
                        width: 120,
                        field: {
                            xtype: 'numberfield',
                            name: 'dis_percentage',
                            minValue: 0
                        }
                    }, {
                        header: 'Total Price',
                        width: 120,
                        dataIndex: 'extent_price',
                    }, {
                        header: 'Action',
                        width: 50,
                        align: 'center',
                        xtype: 'actioncolumn',
                        items: [{
                            xtype: 'button',
                            iconCls: 'icon-delete',
                            handler: function (grid, rowIndex) {
                                var ctrl = App.app.getController("sale.Invoice");

                                var rec = grid.getStore().getAt(rowIndex);
                                ctrl.deleteDetailRecord(grid, rec);
                            }
                        }]
                    }]
                },

                {

                    xtype: 'container',
                    layout: 'hbox',
                    style: 'margin-top:10px',
                    items: [{
                        xtype: 'container',
                        flex: 1,
                        defaults: {
                            width: '100%',
                        },
                        items: [{
                            xtype: 'textarea',
                            name: 'memo',
                            fieldLabel: 'Memo',
                            width: 600,
                            height: 100,
                        }, {
                            xtype: 'invTotalByCurrency'
                        }]
                    }, {
                        xtype: 'container',
                        width: 300,
                        defaults: {
                            labelAlign: 'right'
                        },
                        items: [{
                            xtype: 'hiddenfield',
                            name: 'total_amount'
                        }, {
                            xtype: 'hiddenfield',
                            name: 'grand_total_amount'
                        }, {
                            xtype: 'hiddenfield',
                            name: 'tax_amount'
                        }, {
                            xtype: 'numberfield',
                            fieldLabel: 'Discount(' + App.store.Config.defaultCurrencySymbol + ')',
                            name: 'discount_amount',
                            value: 0,
                            minValue: 0
                        }, {
                            xtype: 'displayfield',
                            name: 'total_amount_display',
                            fieldLabel: 'Sub Total(' + App.store.Config.defaultCurrencySymbol + ')',
                            value: '0.00'
                        }, {
                            xtype: 'numberfield',
                            fieldLabel: 'VAT(%)',
                            name: 'tax_percentag',
                            value: 0,
                            minValue: 0
                        }, {
                            xtype: 'displayfield',
                            fieldLabel: 'Grand Total(' + App.store.Config.defaultCurrencySymbol + ')',
                            name: 'grand_total_amount_display',
                            value: '0.00'
                        }

                        ]
                    }]
                }

            ]

        });
        this.callParent(arguments);
    },
    getTbar: function () {
        var cur = App.store.Config.allCurrency;
        var items = []
        items.push({
            xtype: 'label',
            text: 'Convert Currency To : '
        }
        );
        //-- push default
        items.push({
            xtype: 'radiofield',
            name: 'convertCurrency',
            inputValue: null,
            boxLabel: 'Default Currency',
            checked: true
        })
        for (var index in cur) {
            items.push({
                xtype: 'radiofield',
                name: 'convertCurrency',
                inputValue: cur[index].id,
                boxLabel: cur[index].symbol
            })
        }



        return items;
    },




});
