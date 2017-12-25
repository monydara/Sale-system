
Ext.define('App.view.item.brand.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.brandIndex' ,
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Brand List</font>',
                 tools:[
                    {
                        fieldLabel:'Search',                    
                        xtype:'textfield',
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
                store:'item.Brand',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                    
                    {header:'Name ',flex:1,dataIndex:'name'},
                    {header:'Description',flex:1,dataIndex:'description'},

                   
                ],
                bbar:{
                    xtype:'cPaging',
                    store:'item.Brand',
                },


            }
        ]
        });
        this.callParent(arguments);
    },
   



});