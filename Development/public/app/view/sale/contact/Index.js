
Ext.define('App.view.sale.contact.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.contactIndex' ,

    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Contact List</font>',
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
                store:'sale.Contact',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Name',flex:1,dataIndex:'contact_name'},
                    {header:'Mobile',flex:1,dataIndex:'contact_mobile'},
                    {header:'Email',flex:1,dataIndex:'contact_email'},
                    {header:'Address',flex:1,dataIndex:'contact_address'},


                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'sale.Contact',
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
