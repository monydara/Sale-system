
Ext.define('App.view.reports.customerlist.Index', {
  extend:'App.view.template.report',
  tTitle:'Report Customer List',
  columns:[
          {header:'NO', xtype:'rownumberer', width:50, align:'center'},
          {header:'Code',flex:1,dataIndex:'code'},
          {header:'Name',flex:1,dataIndex:'name'},
          {header:'Legal Name',flex:1,dataIndex:'legal_name'},
          {header:'Mobile',flex:1,dataIndex:'mobile'},
          {header:'Address',flex:1,dataIndex:'address'},
          {header:'Customer Type',flex:1,dataIndex:'customer_type_name' , hidden:true },
          {header:'Custome Price',flex:1,dataIndex:'custom_price_name' , hidden:true },
          {header:'Area',flex:1,dataIndex:'area_name' , hidden:true },
          {header:'Phone',flex:1,dataIndex:'phone' , hidden:true },
          {header:'Email',flex:1,dataIndex:'email' , hidden:true },
          {header:'Contact Name',flex:1,dataIndex:'contact_name' , hidden:true },
          {header:'Create At',flex:1,dataIndex:'created_at' , hidden:true },
      ],
    store:'report.ReportCustomer' ,
    searchItems:[
      {
        xtype:'textfield' ,
        fieldLabel:'Customer Name' ,
        name :'customer_name'
      },{
        xtype:'textfield',
        fieldLabel:'Mobile' ,
        name :'mobile',
      },{
        xtype:'textfield',
        fieldLabel:'Phone',
        name:'phone'
      },{
        xtype:'textfield',
        fieldLabel:'Email',
        name:'email'
      },{
        xtype:'textfield',
        name:'contact_name',
        fieldLabel:'Contact Name'
      },{
          xtype:'cmbCustomerType',

      },{
        xtype:'cmbCustomPrice'
      },
      {
        xtype:'cmbCustomerArea',
      }
    ]
  


});
