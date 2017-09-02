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
            text:'Save',
            iconCls:'icon-save',
            action:'Save'
        },{
            text:'Cancel',
            action:'Cancel',
            iconCls:'icon-cancel'
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
                    dataIndex:'item_id',
                    flex:0.5,
                    editor:{
                        xtype:'combo',
                        store:'combo.Item',
                        valueField:'id',
                        queryMode:'remote',
                        minChars:2,
                        displayField:'name'
                    },
                    renderer:function(value){
                        if (value ) {
                            var store = Ext.getStore('combo.Item');
                            var rec = store.getById(value);
                            return rec.data.name;
                        }else{
                            return "";
                        };
                    }
                },{
                    text:'UOM',
                    dataIndex:'um_id',
                    editor:{
                        xtype:'combo',
                        store:'combo.ItemPrice',
                        valueField:'um_id',
                        displayField:'um'
                    },
                    renderer:function(value){
                        var store = Ext.getStore('combo.UM');
                        var rec = store.getById(value);
                        if (rec) {
                            return rec.data.um;
                        }else{
                            return ""
                        };

                    },
                    flex:0.3
                },{
                    text:'Price',
                    dataIndex:'price',
                    flex:0.2,
                    field:{
                        xtype:'numberfield',
                        minValue:0
                    }
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
