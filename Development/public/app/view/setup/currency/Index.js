
Ext.define('App.view.setup.currency.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.currencyIndex' ,

    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Currency List</font>',
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
                store:'setup.Currency',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Currency',flex:1,dataIndex:'name'},
                    {header:'Symbol',flex:1,dataIndex:'symbol'},
                    {header:'Abbrivation',flex:1,dataIndex:'abbr'},
                    {header:'Rate In',flex:1,dataIndex:'rate_in'},
                    {header:'Rate Out',flex:1,dataIndex:'rate_out'},


                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'setup.Currency',
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
