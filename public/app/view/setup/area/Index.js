
Ext.define('App.view.setup.area.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.areaIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Area List</font>',
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
                store:'setup.Area',                
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},                                    
                    
                    {header:'Code',flex:1,dataIndex:'code'},
                    {header:'Name ',flex:1,dataIndex:'name'},
    
                   
                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'setup.Area',
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