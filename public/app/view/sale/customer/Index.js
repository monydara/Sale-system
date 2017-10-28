
Ext.define('App.view.sale.customer.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.customerIndex' ,

    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Customer List</font>',
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
                store:'sale.Customer',
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                    {header:'Code', dataIndex:'code'},
                    {header:'Name ',width:150,dataIndex:'name'},
                    {header:'Legal Name',width:150,dataIndex:'legal_name'},
                    {header:'Phone',width:150,dataIndex:'phone'},
                    {header:'Contact',width:150,dataIndex:'contact_name'},
                    {header:'Contact Phone',width:150,dataIndex:'contact_mobile'},
                    {header:'Area', flex:1 , dataIndex:'area_name'}

                ],
                bbar:{
                    xtype:'cPaging' ,
                    store:'sale.Customer',
                }
            },{
                xtype:'FormCustomer'
            }
        ]
        });
        this.callParent(arguments);
    },




});
