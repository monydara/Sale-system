Ext.define('App.view.setup.position.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.positionIndex',

    border: true,
    layout: 'card',
    initComponent: function() {
        Ext.apply(this, {
            items: [

                {
                    title: '<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Position List</font>',
                    tools: [
                        {
                            xtype:'cBtnAdd'
                        }, {
                            xtype: 'button',
                            action: 'Edit',
                            tooltip: 'Edit Position',
                            style: 'margin-left:5px',
                            iconCls: 'icon-edit'
                        },{
                            xtype:'button',
                            action:'Delete',
                            tooltip:'Delete Position',
                            style: 'margin-left:5px',
                            iconCls: 'icon-delete'
                        }
                    ],
                    xtype: 'grid',
                    border: true,
                    name: 'index',
                    store: 'setup.Position',
                    columns: [{
                            header: 'NO',
                            xtype: 'rownumberer',
                            width: 50,
                            align: 'center'
                        },

                        {
                            header: 'Position',
                            flex: 1,
                            dataIndex: 'name'
                        }, {
                            header: 'Desription ',
                            flex: 1,
                            dataIndex: 'description'
                        }


                    ],
                    bbar: {
                        xtype:'cPaging',
                        store: 'setup.Position',
                    }

                }
            ]
        });
        this.callParent(arguments);
    },



});