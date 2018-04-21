
Ext.define('App.view.reports.customerBalance.Index', {
    extend:'App.view.template.report',
    tTitle:'Report Customer Balance',
    columns:[
        {header:'NO', xtype:'rownumberer', width:50, align:'center'},
        {header:'Customer',flex:1,dataIndex:'customer_name'},
      {
        header:'Balance', flex: 1 ,dataIndex:'balance',
        renderer:function(value , cl , rec){

        return App.conf.GlobalFn.currencyFormat(value , rec.get("currency_id"));

        }
      },

    ],
    searchItems:[
      {
        xtype:'cmbCustomer' ,
      },{
        xtype:'cmbCurrency',
        allowBlank:true,
        colspan:2,
      }
    ],
     store:'report.ReportCustomerBalance',

  

});
