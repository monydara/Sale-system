
Ext.define('App.view.item.um.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.umIndex' ,
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > UM List</font>',
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
                store:'item.UM',                
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Code', width:150, dataIndex:'code'},
                    {header:'Name', width:300, dataIndex:'name'},
                    {header:'Abbreviation', width:300, dataIndex:'abbreviation'},
                    {header: 'Remark', flex:1, dataIndex: 'remark'},
                ],
                bbar:{
                    xtype:'cPaging',
                    store:'item.UM',
                }

            }
            ,{
                xtype:'FormUM'
            }
        ]
        });
        this.callParent(arguments);
    },

});