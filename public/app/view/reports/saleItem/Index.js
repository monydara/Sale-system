
Ext.define('App.view.reports.saleItem.Index', {
    extend:'App.view.template.report',
    tTitle:'Report Sale By Item',
    columns:[
      { header:'NO', xtype:'rownumberer', width:50, align:'center'},
      { header:'Invoice No',flex:1,dataIndex:'invoice_no'},
      { header:'Item Name',flex:1,dataIndex:'item_name'},
      { header:'Item Code',flex:1,dataIndex:'item_code'},
      { header:'qty',flex:1,dataIndex:'qty'},
      { header:'Unit Price',flex:1,dataIndex:'price',
        renderer: function(value,cl , rec ){
          console.log(rec.get('currency_id'));
            return Ext.util.Format.currency(value ,rec.get('symbol'), 2 );
        }
      },
      { header:'Dis(%)',flex:1,dataIndex:'dis_percentage'},

      { header:'Dis($)',flex:1,dataIndex:'dis_amount',
        renderer: function(value, cl, rec  ){

            return Ext.util.Format.currency(value ,rec.get('symbol'), 2 );
        },
        hidden:true
      },

      { header:'Total Price',flex:1,dataIndex:'extent_price',
        renderer: function(value, cls ,rec ){
            return Ext.util.Format.currency(value , rec.get('symbol'), 2 );
        }
      },

      { header:'Create At',flex:1,dataIndex:'created_at' ,
        renderer:function(value){
          return Ext.util.Format.date(value,'Y-m-d')
        },
       hidden:true
     },
   ],
   store:'report.ReportSaleItem',
   searchItems:[
     // item , invoice ,
     {
       xtype:'cmbItem',

     },{
       xtype:'cmbInvoice'
     }
   ]



});
