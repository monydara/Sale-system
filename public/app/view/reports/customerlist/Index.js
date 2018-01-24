
Ext.define('App.view.reports.customerlist.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.reportCustomerList' ,
    border:true,
    layout:'card',
    initComponent:function () {
        var columns =[
            {header:'NO', xtype:'rownumberer', width:50, align:'center'},
            {header:'Code',flex:1,dataIndex:'code'},
            {header:'Name',flex:1,dataIndex:'name'},
            {header:'Legal Name',flex:1,dataIndex:'legal_name'},
            {header:'Mobile',flex:1,dataIndex:'mobile'},
            {header:'Address',flex:1,dataIndex:'address'},
            {header:'Customer Type',flex:1,dataIndex:'customer_type_name' , hidden:true },
            {header:'Custome Price',flex:1,dataIndex:'custom_price_name' , hidden:true },
            {header:'Phone',flex:1,dataIndex:'phone' , hidden:true },
            {header:'Email',flex:1,dataIndex:'email' , hidden:true },
            {header:'Contact Name',flex:1,dataIndex:'contact_name' , hidden:true },
            {header:'Create At',flex:1,dataIndex:'created_at' , hidden:true },
        ];

        var itemCheckBoxs = this.getItemCheckBox(columns);
        Ext.apply(this, {
            items:[
            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Report Customer List</font>',
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
                        hidden:true,

                      }

                ]}],
                xtype:'grid',
                border:true,
                name:'index',
               store:'report.ReportCustomer',
                columns:columns,
                bbar:{
                    xtype:'cPaging',
                    store:'report.ReportCustomer',
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
