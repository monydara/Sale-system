Ext.define('App.view.sale.customPrice.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.customPriceIndex' ,
    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Custom Price List</font>',
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
                        tooltip:'Add New Lead'
                    },{
                        xtype:'button',
                        action:'Edit',
                        tooltip:'Edit Lead',
                        style:'margin-left:5px',
                        iconCls:'icon-edit'
                    }
                ],
                xtype:'grid',
                border:true,
                name:'index',
                store:'sale.CustomPrice',
                    viewConfig: {
                    enableTextSelection: true
                },
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                    {header:'Name', dataIndex:'name' , width:150},
                    {header:'Description', dataIndex:'description' , flex:1},
                    {header:'Status',width:90, dataIndex:'is_active',
                      renderer :function(value ){
                        if (value == true ) {
                          return "Active"
                        }else{
                          return "Deactive"
                        }
                      }
                    }

                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'sale.CustomPrice',
                    displayInfo: true,
                    displayMsg: 'view {0} - {1} of {2}',
                    emptyMsg: "view 0"
                })

            },{
                xtype:'FormCustomPrice'
            }
        ]
        });
        this.callParent(arguments);
    },




});
