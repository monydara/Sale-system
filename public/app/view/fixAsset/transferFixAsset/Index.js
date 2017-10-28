
Ext.define('App.view.fixAsset.transferFixAsset.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.transferFixAssetIndex' ,     
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Transfer Item List</font>',
                tools:[
                    {
                        fieldLabel:'Search',                    
                        xtype:'textfield',
                        style:'margin-left',
                        name:'Search',
                        emptyText:'-- Search Record --'
                    },
                    // '->',
                    {
                        xtype:'cBtnAdd'
                    },{
                        xtype:'cBtnEdit'
                    }
                ],
                xtype:'grid',
                border:true,
                name:'index',
                store:'fixAsset.TransferFixAsset',                
                columns:[
                    {
                        header:'NO', 
                        xtype:'rownumberer',
                        width:50, 
                        align:'center',
                    }, 
                    {
                        header:'Reference No ',
                        width:200,
                        dataIndex:'ref_no', 
                        align:'center'
                    },
                    {
                        header:'From Location',
                        width:150,
                        dataIndex:'form_location', 
                        align:'center'
                    },
                    {
                        header:'To Location',
                        width:150,
                        dataIndex:'to_location',
                        align:'center'
                    },
                    {
                        header: 'Transfer Date',
                        width:150,
                        dataIndex:'date',
                        align:'center'
                    },
                    {
                        header:'Remark',
                        flex:1,
                        dataIndex:'remark', 
                        align:'center'
                    },
                   
                ],
                bbar:{
                    xtype:'cPaging',
                    store:'fixAsset.TransferFixAsset',
                },


            },{
                xtype:'FormTransfer'
            }
        ]
        });
        this.callParent(arguments);
    },
});