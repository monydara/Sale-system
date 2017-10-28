
Ext.define('App.view.setup.paymentTerm.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.paymentTermIndex' ,

    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Payment Term List</font>',
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
                store:'setup.PaymentTerm',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Payment Term',width:200,dataIndex:'payment_term_name'},
                    {header:'Description ',flex:1,dataIndex:'payment_term_description'},

                ],
                bbar:{
                    xtype:'cPaging',
                    store:'setup.PaymentTerm',
                },


            }
        ]
        });
        this.callParent(arguments);
    },




});
