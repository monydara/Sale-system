
Ext.define('App.view.item.itemcategory.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.itemcategoryIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Item Category List</font>',
                 tools:[
                    {
                        // fieldLabel:'Search',                    
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
                        tooltip:'Add New'
                    },{
                        xtype:'button',
                        action:'Edit',
                        tooltip:'Edit',
                        style:'margin-left:5px',
                        iconCls:'icon-edit'
                    }
                ],
                xtype:'grid',
                border:true,
                name:'index',
                store:'item.ItemCategory',                
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Name', width:300, dataIndex:'name'},
                    {header: 'Remark', flex:1, dataIndex: 'remark'},
                    {header:'Status',width:100, dataIndex:'is_active'},
                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'item.ItemCategory',
                    displayInfo: true,
                    displayMsg: 'view {0} - {1} of {2}',
                    emptyMsg: "view 0"
                })

            }
            ,{
                xtype:'FormItemCategory'
            }
        ]
        });
        this.callParent(arguments);
    },

});