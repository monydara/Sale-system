Ext.define('App.view.template.report', {
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
        var columns =this.columns; // call child columns
        var store = this.store; // call child store
        var searchItems= this.searchItems ; // call child store
        var title = this.tTitle; // report title ;
        var itemCheckBoxs = this.getItemCheckBox(columns);
        Ext.apply(this, {
            items:[
            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" >'+title+'</font>',
                tbar:[
                  {
                    xtype:'form',
                    name:'search',


                    bbar:[
                      '->',

                      {
                        xtype:'cBtnSearch',
                      },{
                        xtype:'cBtnPrint'
                      },{
                        xtype:'cBtnOption'
                      },{
                        xtype:'button',
                        iconCls:'icon-refresh',
                        action:'Reset'
                      }

                    ],
                    items:[
                      {
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
                        items:searchItems
                      },

                      {
                        xtype:'panel',
                        name:'columns',
                        border:true,
                        bodyPadding:10,
                        width: 800,
                        layout:{
                            type:'table',
                            columns:6

                        },
                        title:'Hide/Show Column',
                        fieldLabel: 'Toppings',
                        defaultType: 'checkboxfield',
                        defaults:{
                          width:133
                        },
                        items:itemCheckBoxs,
                      //  hidden:true,

                      }

                ]}],
                xtype:'grid',
                border:true,
                name:'index',
               store:store,
                columns:columns,
                bbar:{
                    xtype:'cPaging',
                    store:store,
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
