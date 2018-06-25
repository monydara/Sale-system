Ext.define('App.view.sale.quotation.Frm', {
    extend: 'Ext.form.Panel',
    alias: 'widget.quotationForm',
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
    items: [{
            xtype: 'container',
            layout: 'hbox',
            items: [{
                xtype: 'container',
                flex: 1,
                html:'<u>Quotation</u>',
                cls:'title_form'

            }, {
                xtype: 'container',
                width: 350,
                defaults: {
                    labelAlign: 'right',
                    width: 350
                },
                items: [{
                    xtype: 'textfield',
                    name: 'sale_quotation_no',
                    emptyText: 'Quotation Code',
                    allowBlank: false,
                    readOnly:true,
                    fieldLabel: 'Code<span style="color:red">*</span>',
                }, {
                    xtype: 'datefield',
                    fieldLabel: 'Date<span style="color:red">*</span>',
                    allowBlank: false,
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
            items: [

                {
                    xtype:'combo',
                    name:'quotation_to',
                    value:'Customer',
                    fieldLabel:'Quotation To',
                    editable:false ,
                    store:["Customer", "Lead"]
                },
                {
                    xtype: 'combo',
                    fieldLabel: 'Customer'+redStar,
                    allowBlank: false,
                    emptyText: '-- Select Customer --',
                    store: 'combo.Customer',
                    forceSelection:true,
                    queryMode:'remote',
                    minChars:2,
                    valueField: 'id',
                    // editable: false,
                    displayField: 'name',
                    name: 'customer_id'
                }, {
                    xtype: 'combo',
                    fieldLabel: 'Lead'+redStar,
                    emptyText: '-- Select Lead --',
                    store: 'combo.Lead',
                    queryMode:'remote',
                    forceSelection:true,
                    minChars:2,
                    valueField: 'id',

                    displayField: 'name',
                    name: 'lead_id'

                },{
                    xtype: 'textfield',
                    fieldLabel: 'Ref No.',
                    name: 'ref_no',
                }, {
                    xtype: 'textfield',
                    fieldLabel: 'Contact Person',
                    name: 'contact_person_name',
                    readOnly:true,
                    emptyText: 'Contact Name '
                }, {
                    xtype: 'combo',
                    fieldLabel: 'Sale Rep.'+redStar,
                    store:'combo.SaleRepresentative',
                    queryMode:'remote',
                    minChars: 2,                   
                    forceSelection:true,
                    allowBlank:false ,
                    valueField:'id',
                    displayField:'name',
                    name: 'sale_representative_id',
                    emptyText: '-- Sale Representative --'
                }, {
                    xtype: 'textfield',
                    fieldLabel: 'Phone',
                    name: 'phone',
                    readOnly:true ,
                }, {
                    xtype: 'datefield',
                    fieldLabel: 'Expire Date',
                    name: "expire_date",
                    value: new Date(),
                    format: 'd-m-Y',
                    colspan:2,
                    submitFormat: 'Y-m-d'
                },{
                    xtype:'container',
                    html:'<hr> ',
                    colspan:2,
                    width:800
                },{
                    xtype:'combo',
                    store:'combo.PaymentTerm',
                    valueField:'id',
                    displayField:'payment_term_name',
                    editable:false,
                    name:'payment_term_id',
                    queryMode: 'remote',
                    // midChar: 4,
                    fieldLabel:"Payment Term"+redStar,
                    allowBlank:false,
                    colspan:2
                },
                // {
                //     xtype: 'textarea',
                //     fieldLabel:"Term Description ",
                //     name: 'payment_term'
                // },

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
            store: 'sale.QuotationDetail',
            title: 'Qauotion Item',
            tools: [{
                xtype: 'textfield',
                name: 'serialOrBarcode',
                emptyText: 'Serial or Barcode'
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
                header: 'Item',
                dataIndex: 'item_name',
                width: 200,
                // locked: true,
                editor: {
                    xtype: 'combo',
                    displayField: 'name',
                    store: 'combo.Item',
                    valueField: 'name',
                    name: 'name',
                    queryMode: 'remote',
                    typeAhead: true,
                    minChars: 3,
                    triggerAction: 'all',
                    listeners: {
                        select: function(combo, record, index) {
                            var rec = record[0];
                            App.app.getController("sale.Quotation").itemRecord = rec;

                        }
                    },
                }
            }, {
                header: 'Code',
                dataIndex: 'code',
                width: 100,
                editor: {
                    xtype: 'combo',
                    displayField: 'code',
                    valueField: 'code',
                    store: 'combo.Item',
                    name: 'code',
                    queryMode: 'local',
                    typeAhead: true,
                    triggerAction: 'all',
                    listeners: {
                        select: function(combo, record, index) {
                            var rec = record[0];
                            App.app.getController("sale.Quotation").itemRecord = rec;

                        }
                    },
                }

            }, {
                header: 'Barcode',
                width: 100,
                dataIndex: 'barcode',
                editor: {
                    xtype: 'combo',
                    displayField: 'barcode',
                    valueField: 'barcode',
                    store: 'combo.Item',
                    name: 'barcode',
                    queryMode: 'local',
                    typeAhead: true,
                    triggerAction: 'all',
                    listeners: {
                        select: function(combo, record, index) {
                            var rec = record[0];
                            App.app.getController("sale.Quotation").itemRecord = rec;

                        }
                    },
                }

            }, {
                header: 'UoM',
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
                        select: function(combo, record, index) {
                            var rec = record[0];
                            App.app.getController("sale.Quotation").umRecord = rec;

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
                width: 120,
                field: {
                    xtype: 'numberfield',
                    name: 'price',
                    minValue: 0
                }

            }, {
                header: 'Extend Price',
                width: 120,
                dataIndex: 'extent_price',
                // renderer: 'usMoney'

            },

            {
                header: 'Image',
                width: 100,
                dataIndex: 'image_url',
                align: 'center',
                renderer: function(value) {
                    image = "<img src='" + value + "' width=50px height=50px > "
                        return "<span style='color:black'><b>" + image + "</b></span>"
                    }
            },


            // {
            //     header:'Description',
            //     dataIndex:'description',
            //     width:200 ,
            //     field:{
            //         xtype:'textarea'
            //     }
            // },
             
            {
                header: 'Action',
                minWidth:100 ,
                flex: 1,
                align: 'center',
                xtype: 'actioncolumn',
                items: [{
                    xtype: 'button',
                    iconCls: 'icon-delete',
                    handler: function(grid, rowIndex) {
                        var ctrl = App.app.getController("sale.Quotation");

                        var rec = grid.getStore().getAt(rowIndex);
                        ctrl.deleteDetailRecord(grid , rec);
                    }
                }, 
                {
                    xtype: 'button',
                    iconCls: 'icon-edit',
                    tooltip: 'Edit Item Description',
                    handler: function(grid, rowIndex) {
                        var ctrl = App.app.getController("sale.Quotation");

                        var rec = grid.getStore().getAt(rowIndex);
                        ctrl.editDetailRecord(grid , rec);
                    }

                   }]
            }]
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
                    width: 600 ,
                    heith: 200 ,
                }, {
                    xtype: 'textarea',
                    name: 'note',
                    height: 200 ,
                    width: 600 ,
                    fieldLabel: 'Note',
                    value:". For meal, accommodation and transport respond by customer for out of Phnom Penh pay by cash. \n "+
". In any other case, the customer request other options for an unavailable service in above modules, it is also discussed for more charge. \n " +
". Free two times training and fully stand-by. \n"+
". Free 6-months support and maintenance for first installation. \n"+
". Annually Support and maintenance charge 20% of full amount of product's price after free 06-month of maintenance.\n"+
". Free installation 5 PC"

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
                        xtype: 'displayfield',
                        name: 'total_amount_display',
                        fieldLabel: 'Total($)',
                        value: '0.00'
                    },
                    // {
                    //    xtype: 'fieldset',
                    //     xtype: 'form',
                    //     name: 'vatForm',
                    //     // title: 'VAT',
                    //     border: true,
                    //     // style: 'border: 1px solid gray;',
                    //     width: 300,
                       

                    //     items: [

                    //         {
                    //             xtype: 'fieldcontainer',
                    //             fieldLabel: 'VAT',
                    //             labelAlign: 'right',
                    //             labelWidth: 100,
                    //             defaultType: 'checkbox',
                    //             defaults: {
                    //                 flex: 1
                    //             },
                    //             items: [{
                    //                 boxLabel: 'Include',
                    //                 style: 'color:blue',
                    //                 name: 'is_vat',
                    //                 inputValue: 1,
                    //                 checkedValue: true,
                    //                 uncheckedValue: false,
                    //                 checked: true
                    //             }, {
                    //                 boxLabel: 'Exclude',
                    //                 style: 'color:red',
                    //                 name: 'is_vat',
                    //                 inputValue: 0,
                    //                 checkedValue: false,
                    //                 uncheckedValue: true,

                    //             }]
                    //         }
                    //     ],
                       
                    // },
                    {
                    xtype:'checkbox',
                    name:'is_vat',
                    fieldLabel:'VAT?',
                    },
                    {
                        xtype: 'numberfield',
                        fieldLabel: 'VAT(%)',
                        name: 'tax_percentag',
                        value: 0,
                        minValue: 0
                    }, 
                  
                    {
                        xtype: 'displayfield',
                        fieldLabel: 'Grand Total($)',
                        name: 'grand_total_amount_display',
                        value: '0.00'
                    }

                ]
            }]
        }

    ]



});
