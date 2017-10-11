
Ext.define('App.view.setup.menu.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.menuIndex' ,

    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Menu List</font>',
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
                store:'setup.Menu',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Menu',flex:1,dataIndex:'menu'},
                    {header:'View',flex:1,dataIndex:'view_index'},
                    {header:'Controller',flex:1,dataIndex:'controller_name'},
                    {header:'Is Leaf',flex:1,dataIndex:'is_leaf'},


                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'setup.Menu',
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
