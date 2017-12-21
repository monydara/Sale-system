
Ext.define('App.view.setup.area.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.areaIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Area List</font>',
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
                store:'setup.Area',                
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                    
                    {header:'Code',flex:1,dataIndex:'code'},
                    {header:'Name ',flex:1,dataIndex:'name'},
    
                   
                ],
                bbar:{
                    xtype:'cPaging',
                    store:'setup.Area',
                },


            }
        ]
        });
        this.callParent(arguments);
    },
   



});