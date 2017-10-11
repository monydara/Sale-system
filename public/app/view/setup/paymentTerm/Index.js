
Ext.define('App.view.setup.paymentTerm.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.paymentTermIndex' ,

    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Payment Term List</font>',
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
                        tooltip:'Add New Payment Term'
                    },{
                        xtype:'button',
                        action:'Edit',
                        tooltip:'Edit Payment Term',
                        style:'margin-left:5px',
                        iconCls:'icon-edit'
                    }
                ],
                xtype:'grid',
                border:true,
                name:'index',
                store:'setup.PaymentTerm',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Payment Term',width:200,dataIndex:'payment_term_name'},
                    {header:'Description ',flex:1,dataIndex:'payment_term_description'},

                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'setup.PaymentTerm',
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
