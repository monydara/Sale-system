
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
                        fieldLabel:'Search',                    
                        xtype:'textfield',
                        name:'Search',
                        emptyText:'-- Search Record --'
                    },
                    // '->',
                    {
                        action:'Add',
                        xtype:'button',
                        style:'margin-left:5px',
                        iconCls:'icon-add',
                        tooltip:'Add New Customer Payment'
                    },{
                        xtype:'button',
                        action:'Edit',
                        tooltip:'Edit Customer Payment', 
                        style:'margin-left:5px',
                        iconCls:'icon-edit'
                    },{
                        xtype:'button',
                        iconCls:'icon-printer',
                        style:'margin-left:5px',
                        action:'Print'
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
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'sale.CustomerPayment',
                    displayInfo: true,
                    displayMsg: 'view {0} - {1} of {2}',
                    emptyMsg: "view 0"
                })

            },{
                xtype:'FormCustomerPayment'
            }
        ]
        });
        this.callParent(arguments);
    },
   



});