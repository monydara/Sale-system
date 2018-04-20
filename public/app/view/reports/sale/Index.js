
Ext.define('App.view.reports.sale.Index', {
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
                        xtype:'txtDate',
                        fieldLabel:'From Date',
                        name:'from_date'
                      },{
                        xtype:'txtDate',
                        fieldLabel:'End Date',
                        name:'end_date'
                      },{
                        xtype:'cmbCustomer' ,
                        // fieldLabel:'Customer Name' ,
                        // name :'customer_name'
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
               store:'report.ReportSale',
                columns:columns,
                bbar:{
                    xtype:'cPaging',
                    store:'report.ReportSale',
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
