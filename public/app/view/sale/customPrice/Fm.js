Ext.define('App.view.sale.customPrice.Fm', {
    extend:'Ext.form.Panel',
    alias:'widget.FormCustomPrice' ,
    bodyPadding:20 ,
    border:true,
    autoScroll:true,
    // title:'Custom Price Form',
    buttons:[
        '->',

        {
            xtype:'cBtnSave'
        },{
           xtype:'cBtnCancel'
        }
    ],

    items:[
        {
            xtype: 'container',
            layout: 'hbox',
            items: [{
                xtype: 'container',
                flex: 1,
                html: '<u>Custom Price</u>',
                cls: 'title_form'

            }, {
                xtype: 'container',
                width: 350,
                defaults: {
                    labelAlign: 'right',
                    width: 350
                },
                items: [{
                    xtype: 'datefield',
                    fieldLabel: 'Date',
                    emptyText: 'DD-MM-YYYY',
                    name: 'created_at',
                    value: new Date(),
                    readOnly:true,
                    format: 'd-m-Y',
                    submitFormat: 'Y-m-d'
                }]
            }]
        },

        {
             xtype:'fieldset',
            title:'<b>Basic Info</b>',
            colspan:2 ,
            padding:10,
            width:"100%" ,
            layout:{
                type:'table',
                columns:2
            },
            defaults:{
                style:'margin-left:10px',
                width:"98%",
                labelWidth:120,
                allowBlank:true,
            },
            defaultType:'textfield',
            items:[
                {
                  xtype:'textfield' ,
                  fieldLabel:'Name'+redStar,
                  name:'name'
                },{
                    xtype:'combo',
                    name:'is_active',
                    store:'combo.Status',
                    valueField:'id',
                    displayField:'name',
                    fieldLabel:'Status'+redStar,
                    editable:false ,
                    allowBlank:false

                },{
                  xtype:'textarea',
                  fieldLabel:'Description',
                  name:'description',
                  allowBlank:true ,


                }
            ]
        },{
            xtype:"grid",
            title:'Item Detail ',
            width:'100%',
            colspan:2 ,
            plugins: Ext.create('Ext.grid.plugin.CellEditing', {
                clicksToEdit: 1
            }),
            viewConfig : {
              getRowClass : function(record,id){
                  console.log( record.get('_destroy') , '-- result record delete');
                 if(record.get('_destroy') == true){

                    return 'hidden';
                 }
              }
           },
            selModel: {
                selType: 'cellmodel'
            },
            store:'sale.CustomPriceDetail',
            style:"border:1px solid silver",
            tools:[
                {
                    xtype:'button',
                    iconCls:'icon-add',
                    action:'AddItemDetail',
                    tooltip:'Add New Item'
                }
            ],
            columns:[
                {
                    xtype:'rownumberer',
                    text:'No',
                    width:50,
                    align:'center'
                },{
                    text:'ITEM NAME',
                    dataIndex:'item_name',
                    flex:0.5,
                    editor:{
                        xtype:'combo',
                        store:'combo.Item',
                        valueField:'name',
                        queryMode:'remote',
                        minChars:2,
                        displayField:'name',
                        listeners: {
                            select: function(combo, record, index) {
                                var rec = record[0];
                                console.log(rec);
                                App.app.getController("sale.CustomPrice").itemRecord = rec;

                            }
                        },
                    },

                },{
                    text:'UOM',
                    dataIndex:'um_name',
                    editor:{
                        xtype:'combo',
                        store:'combo.ItemPrice',
                        queryMode:'local',
                        valueField:'um',
                        displayField:'um',
                        listeners: {
                            select: function(combo, record, index) {
                                var rec = record[0];
                                console.log(rec);
                                App.app.getController("sale.CustomPrice").umRecord = rec;

                            }
                        },
                    },

                    flex:0.3
                },{
                    text:'Price',
                    dataIndex:'price',
                    flex:0.2
                },{
                    text:'Extend Price',
                    dataIndex:'extend_price',
                    flex:0.2,
                    field:{
                        xtype:'numberfield',
                        minValue:0
                    }
                },{
                    text:'Currency',
                    dataIndex:'symbol'
                },{
                    header: 'Action',
                    minWidth: 100,
                    width:60 ,
                    align: 'center',
                    xtype: 'actioncolumn',
                    items: [
                        {
                            xtype: 'button',
                            iconCls: 'icon-delete',
                            handler: function(grid, rowIndex) {
                                var ctrl = App.app.getController("sale.CustomPrice");

                                var rec = grid.getStore().getAt(rowIndex);
                                ctrl.deleteDetailRecord(grid, rec);
                            }
                        }
                    ]
                }

            ],
            height:200,

        },


    ]

});
