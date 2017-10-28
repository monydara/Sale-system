
Ext.define('App.view.item.adjuststock.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.adjuststockIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Adjust Stock List</font>',
                 tools:[
                    {
                        // fieldLabel:'Search',                    
                        xtype:'textfield',
                        name:'Search',
                        emptyText:'-- Search Record --',
                        style:'margin-right:5px',
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
                store:'item.AdjustStock',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Reference No', width:200, dataIndex:'ref_no'},
                    {header:'Location', width:300, dataIndex:'location_name'},
                    {header:'Adjust Date', width:200, dataIndex:'date'},
                    {header:'Remark', flex:1, dataIndex: 'remark'},
                ],
                bbar:{
                    xtype:'cPaging',
                    store:'item.AdjustStock',
                }

            }
            ,{
                xtype:'FormAdjustStock'
            }
        ]
        });
        this.callParent(arguments);
    },

});