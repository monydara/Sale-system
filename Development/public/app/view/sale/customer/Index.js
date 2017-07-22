
Ext.define('App.view.sale.customer.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.customerIndex' ,

    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Customer List</font>',
                 tools:[
                    {
                        fieldLabel:'Search',
                        xtype:'textfield',
                        name:'Search',
                        emptyText:'-- Search Record --'
                    },
                    // '->',
                    {
                        action:'Add',
                        xtype:'button',
                        style:'margin-left:5px',
                        iconCls:'icon-add',
                        tooltip:'Add New Customer'
                    },{
                        xtype:'button',
                        action:'Edit',
                        tooltip:'Edit Customer',
                        style:'margin-left:5px',
                        iconCls:'icon-edit'
                    }
                ],
                xtype:'grid',
                border:true,
                name:'index',
                store:'sale.Customer',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                    {header:'Code', dataIndex:'code'},
                    {header:'Name ',width:150,dataIndex:'name'},
                    {header:'Legal Name',width:150,dataIndex:'legal_name'},
                    {header:'Phone',width:150,dataIndex:'phone'},
                    {header:'Contact',width:150,dataIndex:'contact_name'},
                    {header:'Contact Phone',width:150,dataIndex:'contact_mobile'},
                    {header:'Area', flex:1 , dataIndex:'area_name'}

                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'sale.Customer',
                    displayInfo: true,
                    displayMsg: 'view {0} - {1} of {2}',
                    emptyMsg: "view 0"
                })

            },{
                xtype:'FormCustomer'
            }
        ]
        });
        this.callParent(arguments);
    },




});
