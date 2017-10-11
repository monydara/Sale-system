
Ext.define('App.view.item.um.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.umIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > UM List</font>',
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
                store:'item.UM',                
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Code', width:150, dataIndex:'code'},
                    {header:'Name', width:300, dataIndex:'name'},
                    {header:'Abbreviation', width:300, dataIndex:'abbreviation'},
                    {header: 'Remark', flex:1, dataIndex: 'remark'},
                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'item.UM',
                    displayInfo: true,
                    displayMsg: 'view {0} - {1} of {2}',
                    emptyMsg: "view 0"
                })

            }
            ,{
                xtype:'FormUM'
            }
        ]
        });
        this.callParent(arguments);
    },

});