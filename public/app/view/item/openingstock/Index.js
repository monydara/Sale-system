
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
                      xtype:'cTxtSearch'
                    },
                    {
                        xtype:'cBtnAdd'
                    },{
                      xtype:'cBtnEdit'
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
                bbar:{
                    xtype:'cPaging',
                    store:'item.OpeningStock',
                }
            }
            ,{
                xtype:'FormOpeningStock'
            }
        ]
        });
        this.callParent(arguments);
    },

});