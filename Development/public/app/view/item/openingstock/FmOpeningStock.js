Ext.define('App.view.item.openingstock.FmOpeningStock', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FormOpeningStock',
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
        html: '<u>Opening Stock</u>',
        cls: 'title_form',
    },{
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
    	}, {
        	xtype: 'combo',
        	fieldLabel: 'Location(<span style="color:red">*</span>)',
        	allowBlank: false,
        	emptyText: '-- Select Location --',
        	store: 'combo.Location',
        	valueField: 'id',
        	editable: false,
        	displayField: 'name',
        	name: 'location_id'
    	}, {
        	xtype: 'datefield',
        	name: 'date',
        	fieldLabel: 'Opening date',
        	value: new Date(),
        	format: 'd-m-Y',
        	submitFormat: 'Y-m-d',
    	}, {
        	xtype: 'textarea',
        	style: 'margin-top: 5px; margin-left: 10px',
        	name: 'remark',
        	fieldLabel: 'Remark',
    	}]
    }, {
        xtype: 'grid',
        border: true,
        autoScroll: true,
        height: 350,
        width: '100%',
        title:'Opening Stock Detail',

        style: 'border:1px solid silver;margin-top:10px',
        plugins: Ext.create('Ext.grid.plugin.CellEditing', {
            clicksToEdit: 1
        }),
        selModel: {
            selType: 'cellmodel'
        },
        store: 'item.OpeningStockDetail',
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
                        App.app.getController("item.OpeningStock").itemRecord = rec;
                    }
                },
            }
        }, {
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
                        App.app.getController("item.OpeningStock").itemRecord = rec;
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
            header:'Qty', 
            width: 100, 
            dataIndex:'qty',
            field: {
                    xtype: 'numberfield',
                    name: 'qty',
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
                        App.app.getController("item.OpeningStock").umRecord = rec;
                    }
                }
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
        }],
    }]
});