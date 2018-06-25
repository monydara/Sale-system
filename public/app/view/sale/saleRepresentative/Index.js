Ext.define('App.view.sale.saleRepresentative.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.saleRepresentativeIndex',

    border: true,
    layout: 'card',
    initComponent: function() {
        Ext.apply(this, {
            items: [

                {
                    title: '<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Sale Representative List</font>',
                    tools: [{
                           xtype:'cTxtSearch'
                        },
                        // '->',
                        {
                           xtype:'cBtnAdd'
                        }, {
                            xtype: 'cBtnEdit'
                        }
                    ],
                    xtype: 'grid',
                    border: true,
                    name: 'index',
                    store: 'sale.SaleRepresentative',
                    columns: [{
                            header: 'NO',
                            xtype: 'rownumberer',
                            width: 50,
                            align: 'center'
                        },{
                            header:'Frist Name', 
                            dataIndex:'first_name',
                            width:100,
                        },{
                            header:'Last Name',
                            width:100,
                            dataIndex:'last_name',
                        },{
                            header:'Phone',
                            width:100,
                            dataIndex:'phone'
                        },{
                            width:150,
                            header:'Email',
                            dataIndex:'email'
                        },{
                            header:'Address',
                            dataIndex:'address',
                            flex: 1
                        },

                        {
                            header: 'Status',
                            width: 100,
                            dataIndex: 'status',
                            renderer: function(value) {
                                if (value == "A") {
                                    return "<span style='color:green'><b>Ative </b></span>";
                                } else if (value == "D") {
                                    return "<span style='color:darkblue'><b> Deactive </b></span>";
                                }
                            }

                        }

                    ],
                    bbar: {
                        xtype:'cPaging',
                        store: 'sale.SaleRepresentative'
                    }

                }, {
                    xtype: 'saleRepresentativeForm'
                }
            ]
        });
        this.callParent(arguments);
    },



});