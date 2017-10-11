
Ext.define('App.view.item.openingstock.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.openingstockIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Opening Stock List</font>',
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
                store:'item.OpeningStock',
                columns:[
                    {
                        header:'No', 
                        xtype:'rownumberer', 
                        width:50, 
                        align:'center'
                    }, {
                        header:'Reference No', 
                        width:200, 
                        dataIndex:'ref_no'
                    }, {
                        header: 'Location',
                        width: 300,
                        dataIndex: 'location_name',
                    }, {
                        header:'Opening Date', 
                        width:200, 
                        dataIndex:'date'
                    }, {
                        header:'Remark', 
                        flex:1, 
                        dataIndex: 'remark'
                    },
                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'item.OpeningStock',
                    displayInfo: true,
                    displayMsg: 'view {0} - {1} of {2}',
                    emptyMsg: "view 0"
                })

            }
            ,{
                xtype:'FormOpeningStock'
            }
        ]
        });
        this.callParent(arguments);
    },

});