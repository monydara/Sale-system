Ext.define('App.view.service.maintenance.FmMaintenance', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FormMaintenance',
    bodyPadding: 10,
    border: true,
    autoScroll: true,
    buttons: [
        '->',

        {
            text: 'Save',
            iconCls: 'icon-save',
            action: 'Save'
        }, {
            text: 'Cancel',
            action: 'Cancel',
            iconCls: 'icon-cancel'
        }
    ],

    items: [

        {
            xtype: 'container',
            flex: 1,
            html: '<u>Maintenance</u>',
            cls: 'title_form',
        }, {
            xtype: 'panel',
            layout: {
                type: 'table',
                columns: 3,
            },
            defaults: {
                style: 'margin-left:10px',
                width: 320,
            },
            flex: 1,
            bodyPadding: 10,
            // border: true,
            style: 'border: 1px solid gray; border-radius:5px',
            items: [{
                    xtype: 'combo',
                    fieldLabel: 'Customer(<span style="color:red">*</span>)',
                    allowBlank: false,
                    emptyText: '-- Select Customer --',
                    store: 'combo.Customer',
                    valueField: 'id',
                    editable: false,
                    displayField: 'name',
                    name: 'customer_id'
                }, {
                    xtype: 'combo',
                    name: 'invoice',
                    fieldLabel: 'Invoice',
                }, {
                    xtype: 'datefield',
                    name: 'start_date',
                    fieldLabel: 'Start Date',
                    value: new Date(),
                    format: 'd-m-Y',
                    submitFormat: 'Y-m-d',
                },
                {
                    
                }, {
                    xtype: 'textfield',
                    name: 'maintenance_no',
                    fieldLabel: 'Maintenance No',
                }, {
                    xtype: 'datefield',
                    name: 'end_date',
                    fieldLabel: 'End Date',
                    value: new Date(),
                    format: 'd-m-Y',
                    submitFormat: 'Y-m-d',
                }
            ]
        }, {
            xtype: 'grid',
            border: true,
            autoScroll: true,
            height: 350,
            width: '100%',
            title: 'Maintenance Detail',

            style: 'border:1px solid silver;margin-top:10px',
            plugins: Ext.create('Ext.grid.plugin.CellEditing', {
                clicksToEdit: 1
            }),
            selModel: {
                selType: 'cellmodel'
            },
            store: 'service.MaintenanceDetail',
            tools: [{
                xtype: 'textfield',
                emptyText: 'Serial or Barcode',
                name: 'serialOrBarcode',
            }, {
                xtype: 'button',
                text: 'Add Item',
                style: 'margin-left:5px',
                action: 'AddItem',
                tooltip: 'Add Item',
                iconCls: 'icon-add'
            }],
            columns: [{
                    header: 'NO',
                    xtype: 'rownumberer',
                    width: 50,
                    align: 'center'
                }, {
                    header: 'Item',
                    dataIndex: 'item_name',
                    width: 200,
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
                            select: function(combo, record, index) {
                                var rec = record[0];
                                App.app.getController("service.Maintenance").itemRecord = rec;
                            }
                        },
                    }
                },
                /*{
                           header:'Barcode', 
                           width: 100,
                           dataIndex:'barcode',
                           editor: {
                               xtype: 'combo',
                               displayField: 'barcode',
                               store: 'combo.Item',
                               valueField: 'barcode',
                               name: 'barcode',
                               queryMode: 'local',
                               typeAhead: true,
                               triggerAction: 'all',
                               listeners: {
                                   select: function(combo, record, index) {
                                       var rec = record[0];
                                       App.app.getController("maintenance.maintenance").itemRecord = rec;
                                   }
                               },
                           }
                       }, */
                {
                    header: 'Serial',
                    width: 200,
                    dataIndex: 'serial_no',
                    field: {
                        xtype: 'textfield',
                        name: 'serial_no',
                    }
                }, {
                    header: 'UM',
                    width: 100,
                    dataIndex: 'um',
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
                                App.app.getController("service.Maintenance").umRecord = rec;

                            }
                        }
                    }
                }, {
                    header: 'Qty',
                    width: 100,
                    dataIndex: 'qty',
                    field: {
                        xtype: 'numberfield',
                        name: 'qty',
                    }
                }, {
                    header: 'Price',
                    width: 100,
                    dataIndex: 'price',
                    field: {
                        xtype: 'numberfield',
                        name: 'price',
                    }
                }, {
                    header: 'Extend Price',
                    width: 100,
                    dataIndex: 'extend_price',
                },
                /*{
                           header:'Remark', 
                           width: 180,
                           dataIndex:'remark',
                           field: {
                               xtype: 'textfield',
                               name: 'remark',
                           }
                       }, */
                {
                    header: 'Action',
                    minWidth: 100,
                    flex: 1,
                    align: 'center',
                    xtype: 'actioncolumn',
                    items: [{
                        xtype: 'button',
                        iconCls: 'icon-delete',
                        handler: function(grid, rowIndex) {
                            var rec = grid.getStore().getAt(rowIndex);
                            grid.getStore().remove(rec);
                        }
                    }]
                }
            ],
        }, {
            xtype: 'container',
            layout: 'hbox',
            style: 'margin-top:10px',
            items: [{
                xtype: 'container',
                flex: 1,
                items: [{
                    xtype: 'textarea',
                    name: 'remark',
                    fieldLabel: 'Remark',
                    width: 600,
                }]
            }, {
                xtype: 'container',
                width: 300,
                defaults: {
                    labelAlign: 'right'
                },
                items: [{
                    xtype: 'hiddenfield',
                    name: 'amount',
                    value: 0,
                }, {
                    xtype: 'displayfield',
                    name: 'amount_display',
                    fieldLabel: 'Grand Total($)',
                    value: '0.00',
                }]

            }]

        }

    ]

});