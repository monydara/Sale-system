Ext.define('App.view.sale.customPrice.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.customPriceIndex' ,
    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Custom Price List</font>',
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
                store:'sale.CustomPrice',
                    viewConfig: {
                    enableTextSelection: true
                },
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                    {header:'Name', dataIndex:'name' , width:150},
                    {header:'Description', dataIndex:'description' , flex:1},
                    {header:'Status',width:90, dataIndex:'is_active',
                      renderer :function(value ){
                        if (value == true ) {
                          return "Active"
                        }else{
                          return "Deactive"
                        }
                      }
                    }

                ],
                bbar:{
                    xtype:'cPaging' ,
                    store:'sale.CustomPrice',
                }

            },{
                xtype:'FormCustomPrice'
            }
        ]
        });
        this.callParent(arguments);
    },




});
