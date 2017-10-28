
Ext.define('App.view.item.itemcategory.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.itemcategoryIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Item Category List</font>',
                 tools:[
                    {
                       xtype:'cTxtSearch'
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
                store:'item.ItemCategory',                
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Name', width:300, dataIndex:'name'},
                    {header: 'Remark', flex:1, dataIndex: 'remark'},
                    {header:'Status',width:100, dataIndex:'is_active'},
                ],
                bbar:{
                    xtype:'cPaging' ,
                    store:'item.ItemCategory',
                }

            }
            ,{
                xtype:'FormItemCategory'
            }
        ]
        });
        this.callParent(arguments);
    },

});