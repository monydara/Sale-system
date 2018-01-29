
Ext.define('App.view.reports.customerBalanceDetail.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.report' ,
    border:true,
    layout:'card',
    listeners:{
      afterrender:function(fm){
      //--- default hide form
      fm.down("panel[name=columns]").hide();
      }
    },
    initComponent:function () {
        var columns =[
            {header:'NO', xtype:'rownumberer', width:50, align:'center'},
            {header:'Customer',flex:1,dataIndex:'customer_name'},
            {header:'Tran. Type',flex:1,dataIndex:'transaction_type_name'},
            {header:'Ref. No',flex:1,dataIndex:'ref_no'},
            {header:'Date',flex:1,dataIndex:'date'},
            {header:'Amount',flex:1,dataIndex:'amount',
            renderer:function(value , cl , rec) {
              
              return App.conf.GlobalFn.currencyFormat(value , rec.get("currency_id"));

            }
            },
            {header:'Create At',flex:1,dataIndex:'created_at' , hidden:true },
        ];

        var itemCheckBoxs = this.getItemCheckBox(columns);
        Ext.apply(this, {
            items:[
            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Report Customer Balance Detail</font>',
                tbar:[
                  {
                    xtype:'form',
                    name:'search',
                    layout:{
                        type:'table',
                        columns:2
                    },
                    defaults:{
                        style:'margin-left:10px',
                        // height:40,
                        width:400,
                        allowBlank:true,
                      labelWidth:120,
                    },
                    bbar:[
                      '->',
                      {
                        xtype:'cBtnSearch',
                      },{
                        xtype:'cBtnPrint'
                      },{
                        xtype:'cBtnOption'
                      }

                    ],
                    items:[
                      {
                        xtype:'cmbCustomer' ,
                      },{
                        xtype:'textfield',
                        fieldLabel:'Ref. NO' ,
                        name :'ref_no',
                      },{
                        xtype:'txtDate',
                        fieldLabel:'From',
                        name:'from_date'
                      },{
                        xtype:'txtDate',
                        fieldLabel:'TO',
                        name:'to_date',
                        colspan:2,
                      },{
                        xtype:'panel',
                        name:'columns',
                        colspan:2 ,
                        width: 800,
                        layout:{
                            type:'table',
                            columns:6

                        },
                        title:'Hide/Show Column',
                        fieldLabel: 'Toppings',
                        defaultType: 'checkboxfield',
                        items:itemCheckBoxs,
                      //  hidden:true,

                      }

                ]}],
                xtype:'grid',
                border:true,
                name:'index',
               store:'report.ReportCustomerBalanceDetail',
                columns:columns,
                bbar:{
                    xtype:'cPaging',
                    store:'report.ReportCustomerBalanceDetail',
                }

            }
        ]
        });
        this.callParent(arguments);

    },
    getItemCheckBox:function(columns){
        var items=[];
        columns.forEach(function(column){
            var obj ={
              boxLabel: column.header,
              name: 'column',
              inputValue: column.dataIndex,
              checked: column.hidden != true //  true
            };

            items.push(obj);
        });


      return items;
    }



});
