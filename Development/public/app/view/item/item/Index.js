
Ext.define('App.view.item.item.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.itemIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Item List</font>',
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
                store:'item.Item',                
                columns: [{
                    header:'NO', 
                    xtype:'rownumberer', 
                    width:50, 
                    align:'center',
                }, {
                    header:'Code', 
                    width:100, 
                    dataIndex:'code'
                }, {
                    header:'Barcode', 
                    width:100, 
                    dataIndex:'barcode'
                }, {
                    header:'Name', 
                    width:200, 
                    dataIndex:'name'
                }, {
                    header: 'Unit', 
                    width:100, 
                    dataIndex: 'um_name'
                }, {
                    header:'Item Type', 
                    width:150, 
                    dataIndex:'item_type_name'
                }, {
                    header:'Category',
                    width:150, 
                    dataIndex:'category_name'
                }, {
                    header:'Price',
                    width:100, 
                    dataIndex:'price', 
                    renderer: Ext.util.Format.usMoney
                }, {
                    header:'Reorder Point',
                    width:150, 
                    dataIndex:'re_order_point'
                }, {
                    header:'Status',
                    flex:1, 
                    dataIndex:'status'
                }],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'item.Item',
                    displayInfo: true,
                    displayMsg: 'view {0} - {1} of {2}',
                    emptyMsg: "view 0"
                })

            },{
                xtype:'FormItem'
            }]
        });
        this.callParent(arguments);
    },
   



});