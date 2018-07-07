
Ext.define('App.view.reports.item.Index', {
    extend:'App.view.template.report',
    tTitle:'Report Item',
    // code , name , model , cost , price , category , um , sale_description , purchase Description , is_varaince Product ,
    columns:[
      { header:'NO', xtype:'rownumberer', width:50, align:'center'},
      { header:'Code',flex:1,dataIndex:'code'},
      { header:'Name',flex:1,dataIndex:'name'},
      { header:'Cost',flex:1,dataIndex:'cost'},
      { header:'Price',flex:1,dataIndex:'price',
        renderer: function(value, cl, rec  ){
            return Ext.util.Format.currency(value ,rec.get('symbol'), 2 );
        },
      },
      { header:'Category',flex:1,dataIndex:'category_name'
      },
      { header:'UM',flex:1,dataIndex:'um_name'},

      { header:'Sale Description',flex:1,dataIndex:'sale_description',
        hidden:true
      },

      { header:'Purchase Description',flex:1,dataIndex:'purchase_description'
      },
      { header:'Variance Product',flex:1,dataIndex:'is_variance'
      },

      { header:'Create At',flex:1,dataIndex:'created_at' ,
        renderer:function(value){
          return Ext.util.Format.date(value,'Y-m-d')
        },
       hidden:true
     },
   ],
   store:'report.ReportItem',
   searchItems:[
     // item , invoice ,
     {
       xtype:'cmbItem',

     },{
       xtype:'cmbCategory'
     }
   ]



});
