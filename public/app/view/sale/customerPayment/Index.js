
Ext.define('App.view.sale.customerPayment.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.customerPaymentIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Customer Payment List</font>',
                 tools:[
                    {
                       xtype:'cTxtSearch'
                    },
                    {
                      xtype:'cBtnAdd'
                    },{
                        xtype:'cBtnEdit'
                    },{
                        xtype:'cBtnPrint'
                    }
                ],
                xtype:'grid',
                border:true,
                name:'index',
                store:'sale.CustomerPayment',                
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},                                    
                    {header:'Receipt No.' , dataIndex:'receipt_no'},
                    {header:'Customer Name ',width:200,dataIndex:'customer_name'},
                    {header:'Date',width:150,dataIndex:'date'},
                    {header:'Amount',width:150,dataIndex:'grand_total_amount', 
                        renderer: Ext.util.Format.usMoney,
                    },
                    {header:'Payment Type',width:150,dataIndex:'payment_type', 
                        renderer:function(value){
                            if (value == "CA") {
                                return "Cash";
                            } else if( value == "CH"){
                                return "Cheque";
                            }else if(value == "WI"){
                                return "Win";
                            };
                        }
                    },
                    {header:'Memo', flex:1 , dataIndex:'memo'}
                   
                ],
                bbar:{
                    xtype:'cPaging',
                    store:'sale.CustomerPayment'
                }

            },{
                xtype:'FormCustomerPayment'
            }
        ]
        });
        this.callParent(arguments);
    },
   



});