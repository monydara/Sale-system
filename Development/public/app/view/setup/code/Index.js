Ext.define('App.view.setup.code.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.codeIndex',

    border: true,
    layout: 'card',
    initComponent: function() {
        Ext.apply(this, {
            items: [

                {
                    title: '<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Code List</font>',
                    tools: [{
                            fieldLabel: 'Search',
                            xtype: 'textfield',
                            name: 'Search',
                            emptyText: '-- Search Record --'
                        },
                        // '->',
                        {
                            action: 'Add',
                            xtype: 'button',
                            style: 'margin-left:5px',
                            iconCls: 'icon-add',
                            tooltip: 'Add New Customer'
                        }, {
                            xtype: 'button',
                            action: 'Edit',
                            tooltip: 'Edit Customer',
                            style: 'margin-left:5px',
                            iconCls: 'icon-edit'
                        }
                    ],
                    xtype: 'grid',
                    border: true,
                    name: 'index',
                    store: 'setup.Code',
                    columns: [{
                            header: 'NO',
                            xtype: 'rownumberer',
                            width: 50,
                            align: 'center'
                        },

                        {
                            header: 'Type',
                            flex: 1,
                            dataIndex: 'n_type'
                        }, {
                            header: 'Prefix ',
                            flex: 1,
                            dataIndex: 'prefix'
                        }, {
                            header: 'Next Code ',
                            flex: 1,
                            dataIndex: 'next_code'
                        }, {
                            header: 'Degit ',
                            flex: 1,
                            dataIndex: 'degit'
                        }, {
                            header: 'Generate Code ',
                            flex: 1,
                            dataIndex: 'is_manaul',
                            renderer: function(grid, col, rec) {
                                if (rec.get("is_manaul")) {
                                    return "By Manaul";
                                } else {
                                    return "By System";
                                };
                            }
                        },


                    ],
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store: 'setup.Code',
                        displayInfo: true,
                        displayMsg: 'view {0} - {1} of {2}',
                        emptyMsg: "view 0"
                    })

                }
            ]
        });
        this.callParent(arguments);
    },



});