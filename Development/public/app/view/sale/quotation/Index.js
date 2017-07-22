Ext.define('App.view.sale.quotation.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.quotationIndex',

    border: true,
    layout: 'card',
    initComponent: function() {
        Ext.apply(this, {
            items: [

                {
                    title: '<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Quotation List</font>',
                    tools: [{
                            fieldLabel: 'Search',
                            xtype: 'textfield',
                            name: 'Search',
                            labelAlign: 'right',
                            width: 300,
                            emptyText: '-- Search Quotation --'
                        },
                        // '->',
                        {
                            action: 'Add',
                            xtype: 'button',
                            style: 'margin-left:5px',
                            iconCls: 'icon-add',
                            tooltip: 'Add New Quotation'
                        }, {
                            xtype: 'button',
                            action: 'Edit',
                            tooltip: 'Edit Quotation',
                            style: 'margin-left:5px',
                            iconCls: 'icon-edit'
                        }, {
                            xtype: 'button',
                            style: 'margin-left:5px',
                            iconCls: 'icon-submit',
                            action:'Submit',
                            tooltip: 'Submit Quote'
                        }, {
                            xtype: 'button',
                            style: 'margin-left:5px',
                            action: 'CancelQuotation',
                            tooltip: 'Cancel This Quotation',
                            iconCls: 'icon-delete'
                        }, {
                            xtype: 'button',
                            iconCls: 'icon-printer',
                            action:'Print',
                            tooltip: 'Print Quotation',
                            style: 'margin-left:5px',

                        }, 
                        // {
                            
                        //     xtype: 'button',
                        //     iconCls: 'icon-excel',
                        //     action:'To_excel',
                        //     tooltip: 'Export to Excel',
                        //     style: 'margin-left:5px',
                        // }
                    ],
                    xtype: 'grid',
                    border: true,
                    name: 'index',
                    store: 'sale.Quotation',
                    columns: [{
                            header: 'NO',
                            xtype: 'rownumberer',
                            width: 50,
                            align: 'center'
                        },

                        {
                            header: 'Quotation No ',
                            width: 150,
                            dataIndex: 'sale_quotation_no'
                        }, {
                            header: 'Date',
                            width: 150,
                            dataIndex: 'date'
                        }, {
                            header: 'Customer Name',
                            flex: 1,
                            dataIndex: 'customer_name',
                            renderer:function(a,b ,record){
                                var data =record.getData();
                                if (data.quotation_to == "Lead") {
                                    return data.lead.name ;
                                }else if(data.customer){
                                    return data.customer.name;
                                }else{

                                    return ""
                                };
                            }
                        },{
                            header: 'Amount',
                            width: 150,
                            dataIndex: 'grand_total_amount',
                            renderer: Ext.util.Format.usMoney
                        }, {
                            header: 'Status',
                            width: 100,
                            dataIndex: 'status',
                            renderer: function(value) {
                                if (value == "D") {
                                    return "<span style='color:blue'><b>Draft </b></span>";
                                } else if (value == "S") {
                                    return "<span style='color:darkblue'><b> Submit </b></span>";
                                } else if (value == "C") {
                                    return "<span style='color:red'><b> Cancel </b></span>";
                                } else if (value == "I") {
                                    return "<span style='color:green'><b> Invoiced </b></span>";

                                };
                            }

                        },

                    ],
                    bbar: Ext.create('Ext.PagingToolbar', {
                        store: 'sale.Quotation',
                        displayInfo: true,
                        displayMsg: 'view {0} - {1} of {2}',
                        emptyMsg: "view 0"
                    })

                }, {
                    xtype: 'quotationForm'
                }
            ]
        });
        this.callParent(arguments);
    },



});
