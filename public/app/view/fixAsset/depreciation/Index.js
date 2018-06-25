
Ext.define('App.view.fixAsset.depreciation.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.depreciationIndex' ,     
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[


            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Depreciation List</font>',
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
                // store:'room.Room'
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'}, 
                    {header:'Item ',width:200,dataIndex:'item_name', align:'center'},
                    {header:'Serail',width:100,dataIndex:'serail', align:'center'},
                    {header:'Purchase Date',width:150,dataIndex:'purchase_date',align:'center'},
                    {header:'Cost',width:100,dataIndex:'cost', align:'center'},
                    {header:'Asset Life(Year)',width:150,dataIndex:'aseet_life',align:'center'},
                    {header:'Aseet End Date',width:150,dataIndex:'asset_end_date', align:'center'},
                    {header:'Depr%',width:100,dataIndex:'depreciation', align:'center'},
                    {header:'Remark',flex:1,dataIndex:'remark', align:'center'},
                ],
                bbar:{
                    xtype:'cPaging',
                },


            },{
                xtype:'FormDepreciation'
            }
        ]
        });
        this.callParent(arguments);
    },
   



});