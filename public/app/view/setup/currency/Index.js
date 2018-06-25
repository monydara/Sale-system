
Ext.define('App.view.setup.currency.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.currencyIndex' ,

    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Currency List</font>',
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
                store:'setup.Currency',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Currency',flex:1,dataIndex:'name'},
                    {header:'Symbol',flex:1,dataIndex:'symbol'},
                    {header:'Abbrivation',flex:1,dataIndex:'abbr'},
                    {header:'Rate In',flex:1,dataIndex:'rate_in'},
                    {header:'Rate Out',flex:1,dataIndex:'rate_out'},


                ],
                bbar:{
                    xtype:'cPaging',
                    store:'setup.Currency',
                }

            }
        ]
        });
        this.callParent(arguments);
    },




});
