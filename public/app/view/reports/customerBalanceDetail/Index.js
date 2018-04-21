
Ext.define('App.view.reports.customerBalanceDetail.Index', {
    extend:'App.view.template.report',
    tTitle:'Report Customer Balance Detail',
    columns:[
        {header:'NO', xtype:'rownumberer', width:50, align:'center'},
        {header:'Customer',flex:1,dataIndex:'customer_name'},
        {header:'Tran. Type',flex:1,dataIndex:'transaction_type_name'},
        {header:'Ref. No',flex:1,dataIndex:'ref_no'},
        {header:'Date',flex:1,dataIndex:'date'},
        {header:'Amount',flex:1,dataIndex:'amount',
        renderer:function(value , cl , rec) {

          return App.conf.GlobalFn.currencyFormat(value , rec.get("currency_id"));

        },
      },{
        header:'Balance', flex: 1 ,dataIndex:'balance',
        renderer:function(value , cl , rec){

        return App.conf.GlobalFn.currencyFormat(value , rec.get("currency_id"));

        }
      },
        {header:'Create At',flex:1,dataIndex:'created_at' , hidden:true },
    ],
    store:'report.ReportCustomerBalanceDetail',
    searchItems:[
      {
        xtype:'cmbCustomer' ,
      },{
        xtype:'textfield',
        fieldLabel:'Ref. NO' ,
        name :'ref_no',
      },{
        xtype:'cmbCurrency',
        allowBlank:true,
        colspan:2,
      }
    ],



});
