
Ext.define('App.view.purchase.vender.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.venderIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Vender List</font>',
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
                store:'purchase.Vender',                
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},                                    
                    
                    {header:'Name ',width:200,dataIndex:'name'},
                    {header:'Legal Name',width:150,dataIndex:'legal_name'},
                    {header:'Phone',width:150,dataIndex:'phone'},
                    {header:'Contact',width:150,dataIndex:'contact_name'},
                    {header:'Contact Phone',flex:1,dataIndex:'contact_mobile'},
                   
                ],
                bbar:{
                    xtype:'cPaging',
                    store:'purchase.Vender',
                },

            },{
                xtype:'venderForm'
            }
        ]
        });
        this.callParent(arguments);
    },
   



});