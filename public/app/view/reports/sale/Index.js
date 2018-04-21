
Ext.define('App.view.reports.sale.Index', {
    extend:'App.view.template.report',
    tTitle:'Report Sale',
    columns:[
        {header:'NO', xtype:'rownumberer', width:50, align:'center'},
        {header:'Invoice No',flex:1,dataIndex:'invoice_no'},
        {header:'Customer',flex:1,dataIndex:'name'},
        {header:'Amount',flex:1,dataIndex:'grand_total_amount',
          renderer: function(value ){
              return Ext.util.Format.currency(value , App.store.Config.defaultCurrencySymbol, 2 );
          }
        },
        {header:'Create At',flex:1,dataIndex:'created_at' ,
          renderer:function(value){
            return Ext.util.Format.date(value,'Y-m-d')
          },
         hidden:true },
    ],
    searchItems:[
      {
        xtype:'txtDate',
        fieldLabel:'From Date',
        name:'from_date'
      },{
        xtype:'txtDate',
        fieldLabel:'End Date',
        name:'end_date'
      },{
        xtype:'cmbCustomer' ,

      }
    ],
    store:'report.ReportSale',
  



});
