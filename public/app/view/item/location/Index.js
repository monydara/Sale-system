
Ext.define('App.view.item.location.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.locationIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Location List</font>',
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
                store:'item.Location',                
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Name', flex:1, dataIndex:'name'},
                    {header:'Phone', flex:1, dataIndex:'phone'},
                    {header:'Email', flex:1, dataIndex:'email'},
                    {header:'Address', flex:1, dataIndex:'address'},
                    {header: 'Remark', flex:1, dataIndex: 'remark'},
                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'item.Location',
                    displayInfo: true,
                    displayMsg: 'view {0} - {1} of {2}',
                    emptyMsg: "view 0"
                })

            }
            ,{
                xtype:'FormLocation'
            }
        ]
        });
        this.callParent(arguments);
    },

});