Ext.define('App.view.fixAsset.transferFixAsset.FrmTransfer', {
    extend:'Ext.form.Panel',
    alias:'widget.FormTransfer' ,	       
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
        html: '<u>Transfer Fixed Asset</u>',
        cls: 'title_form',
    },{
        xtype: 'panel',
         layout: {
                type: 'table',
                columns: 2
            },
        defaults: {
            style: 'margin-left:10px',
            width: 400,
        },
        flex: 1,
        bodyPadding: 10,
        style: 'border: 1px solid gray; border-radius:5px',
        items: [{
            xtype: 'textfield',
            name: 'ref_no',
            fieldLabel: 'Reference No',
        }, {
            xtype: 'combo',
            fieldLabel: 'From Location(<span style="color:red">*</span>)',
            allowBlank: false,
            emptyText: '-- Select Location --',
            store: 'combo.Location',
            valueField: 'id',
            editable: false,
            displayField: 'name',
            name: 'from_location_id'
        }, {
            xtype: 'datefield',
            name: 'date',
            fieldLabel: 'Transfer date',
            value: new Date(),
            format: 'd-m-Y',
            submitFormat: 'Y-m-d',
        }, {
            xtype: 'combo',
            fieldLabel: 'To Location(<span style="color:red">*</span>)',
            allowBlank: false,
            emptyText: '-- Select Location --',
            store: 'combo.Location',
            valueField: 'id',
            editable: false,
            displayField: 'name',
            name: 'to_location_id'
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
        title:'Transfer Fixed Asset Detail',

        style: 'border:1px solid silver;margin-top:10px',
        plugins: Ext.create('Ext.grid.plugin.CellEditing', {
            clicksToEdit: 1
        }),
        viewConfig: {
            getRowClass: function(record, id) {
                return record.get("_destroy") == true ? "hidden" : "row-error";
            }
        },
        selModel: {
            selType: 'cellmodel'
        },
        store: 'fixAsset.TransferFixAssetDetail',
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
            width: 300,
            editor: {
                xtype: 'combo',
                displayField: 'name',
                store: 'combo.ItemFixedAsset',
                valueField: 'name',
                name: 'name',
                queryMode: 'local',
                typeAhead: true,
                triggerAction: 'all',
                listeners: {
                    select: function(combo, record, index) {
                        var rec = record[0];
                        App.app.getController("fixAsset.Transfer").itemRecord = rec;
                    }
                },
            }
        }, {
            header:'Barcode', 
            width: 200,
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
                        App.app.getController("fixAsset.Transfer").itemRecord = rec;
                    }
                },
            }
        }, {
            header:'Serial', 
            width: 200,
            dataIndex:'serial_no',
            field: {
                xtype: 'textfield',
                name: 'serial_no',
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
                        select: function(combo, record, index) {
                            var rec = record[0];
                            App.app.getController("fixAsset.Transfer").umRecord = rec;

                        }
                    },
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
            header: 'Action',
            minWidth: 100,
            flex: 1,
            align: 'center',
            xtype: 'actioncolumn',
            items: [{
                xtype: 'button',
                iconCls: 'icon-delete',
                handler: function(grid, rowIndex) {
                    var store = grid.getStore();
                    var rec = store.getAt(rowIndex);
                    if (rec.get("id")> 0 ) {
                        Ext.Msg.confirm("Confirmation", "Do you want to delete?", function(btnText){
                            if(btnText === "no"){
                            }
                            else if(btnText === "yes"){
                                rec.set("_destroy",true);
                                grid.grid.getView().refresh();
                            }
                        }, this);

                       
                    }else{
                        store.remove(rec);
                    };
                }
            }]
        }],
    }]
});