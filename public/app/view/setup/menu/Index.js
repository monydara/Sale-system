
Ext.define('App.view.setup.menu.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.menuIndex' ,

    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Menu List</font>',
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
                store:'setup.Menu',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Menu',flex:1,dataIndex:'menu'},
                    {header:'View',flex:1,dataIndex:'view_index'},
                    {header:'Controller',flex:1,dataIndex:'controller_name'},
                    {header:'Is Leaf',flex:1,dataIndex:'is_leaf'},


                ],
                bbar:{
                    xtype:'cPaging',
                    store:'setup.Menu',
                },


            }
        ]
        });
        this.callParent(arguments);
    },




});
