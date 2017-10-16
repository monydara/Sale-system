Ext.define('App.view.item.adjuststock.FmAdjustStock', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FormAdjustStock',
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

    items: [{
        xtype: 'container',
        flex: 1,
        html: '<u>Adjust Stock</u>',
        cls: 'title_form',
    }, {
       xtype: 'panel',
        defaults: {
            style: 'margin-left:10px',
            width: 400,
        },
        flex: 1,
        bodyPadding: 10,
        // border: true,
        style: 'border: 1px solid gray; border-radius:5px',
        items: [{
            xtype: 'textfield',
            name: 'ref_no',
            fieldLabel: 'Reference No',
            width: 400,
        }, {
            xtype: 'combo',
            name: 'location_id',
            store: 'combo.Location',
            valueField: 'id',
            displayField: 'name',
            queryMode: 'local',
            listeners: Util.firstSelect(),
            autoSelect: true,
            selectOnFocus: true,
            editable: false,
            fieldLabel: 'Location',
            width: 400,
            allowBlank: false,
        }, {
            xtype: 'datefield',
            name: 'date',
            fieldLabel: 'Adjust date',
            width: 400,
            value: new Date(),
            format: 'd-m-Y',
            submitFormat: 'Y-m-d',
        }, {
            xtype: 'textarea',
            style: 'margin-top: 5px; margin-left: 10px',
            name: 'remark',
            fieldLabel: 'Remark',
            width: 400,
        }]
    }, {
        xtype: 'grid',
        border: true,
        autoScroll: true,
        height: 350,
        title:'Adjust Stock Detail',

        style: 'border:1px solid silver;margin-top:10px',
        plugins: Ext.create('Ext.grid.plugin.CellEditing', {
            clicksToEdit: 1
        }),
        selModel: {
            selType: 'cellmodel'
        },
        store: 'item.AdjustStockDetail',
        tools: [{
            xtype: 'button',
            text: 'Add Item',
            style:'margin-left:5px',
            action: 'AddItem',
            tooltip: 'Add Item',
            iconCls: 'icon-add'
        }],
        columns:[{
            header:'NO', xtype:'rownumberer', width:50, align:'center'
        },{
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
                        App.app.getController("item.AdjustStock").itemRecord = rec;
                    }
                },
            }
        }, {
            header:'Serial', 
            width: 100,
            dataIndex:'serial_no',
            field: {
                xtype: 'textfield',
                name: 'serial_no',
            }
        }, {
            header:'Cost', 
            width: 100,
            dataIndex:'cost',
            field: {
                xtype: 'numberfield',
                name: 'cost',
            }
        }, {
            header:'UM', 
            width: 100,
            dataIndex:'um',
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
                        App.app.getController("item.AdjustStock").umRecord = rec;
                    }
                }
            }
        }, {
            header:'extjs Qty', 
            width: 100, 
            dataIndex:'system_qty',
            field: {
                    xtype: 'numberfield',
                    name: 'system_qty',
                }
        }, {
            header:'Real Qty', 
            width: 100,
            dataIndex:'real_qty',
            field: {
                    xtype: 'numberfield',
                    name: 'real_qty',
                }
        }, {
            header:'Diff Qty', 
            width: 100, 
            dataIndex:'qty',
            // field: {
            //         xtype: 'numberfield',
            //         name: 'qty',
            //     }
        }, {
            header:'Type',
            dataIndex:'adjust_type_name',
            width: 100, 
            editor: {
                xtype: 'combo',
                store: 'combo.AdjustStockType',
                valueField: 'name',
                displayField: 'name',
                queryMode: 'local',
                typeAhead: true,
                triggerAction: 'all',
                listeners: {
                    select: function(combo, record, index) {
                        var rec = record[0];
                        App.app.getController("item.AdjustStock").adjustTypeRecord = rec;
                    }
                },
            }
            
        }, {
            header: 'Action',
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
        }],
    }]
});