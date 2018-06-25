
Ext.define('App.view.sale.contact.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.contactIndex' ,

    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Contact List</font>',
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
                store:'sale.Contact',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Name',flex:1,dataIndex:'contact_name'},
                    {header:'Mobile',flex:1,dataIndex:'contact_mobile'},
                    {header:'Email',flex:1,dataIndex:'contact_email'},
                    {header:'Address',flex:1,dataIndex:'contact_address'},


                ],
                bbar:{
                    xtype:'cPaging',
                    store:'sale.Contact',
                }

            }
        ]
        });
        this.callParent(arguments);
    },




});
