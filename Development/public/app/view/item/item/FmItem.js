Ext.define('App.view.item.item.FmItem', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FormItem',
    border: true,
    autoScroll: true,
    bodyPadding: 20,
    buttons: [
        '->', {
            text: 'Save',
            iconCls: 'icon-save',
            action: 'Save'
        }, {
            text: 'Cancel',
            action: 'Cancel',
            iconCls: 'icon-cancel'
        }
    ],

    items: [

        {
            xtype: 'container',
            layout: 'hbox',
            items: [{
                xtype: 'container',
                flex: 1,
                html: '<u>Item</u>',
                cls: 'title_form'

            }, {
                xtype: 'container',
                width: 350,
                defaults: {
                    labelAlign: 'right',
                    width: 350
                },
                items: [{
                    xtype: 'textfield',
                    name: 'code',
                    fieldLabel: 'Code' + redStar,
                    allowBlank: false,
                }, {
                    xtype: 'textfield',
                    name: 'barcode',
                    fieldLabel: 'Barcode',
                }, ]
            }]
        }, {
            layout: {
                type: 'table',
                columns: 2,
            },
            border: true,

            flex: 1,
            bodyPadding: 20,
            defaultType: 'textfield',
            xtype: 'fieldset',
            title: 'Bassic Info',
            defaults: {
                width: 400,
                style: 'margin-left:10px',
            },

            items: [
              {
                  name: 'name',
                  fieldLabel: 'Name'+redStar,
                  allowBlank: false,
              }, {
                  xtype: 'form',
                  style: 'margin-left:10px',
                  width: 300,
                  items: [{
                      xtype: 'image',
                      width: 300,
                      height: 200,
                      style: 'border: 1px solid gray; border-radius:10px',
                      // src:'http://www.chongwu123.info/images/no_image.jpg'
                      // name: 'image_url',
                  }, {
                      xtype: 'hiddenfield',
                      name: 'image_url'
                  }],
                  rowspan: 7,
                  bbar: [{
                      xtype: 'filefield',
                      name: 'image',
                      width: 50,
                      buttonOnly: true,
                  }, '->', {
                      text: 'Remove',
                      action: 'Remove',
                  }],
              },{
                  xtype: 'combo',
                  name: 'item_type_id',
                  store: 'combo.ItemType',
                  valueField: 'id',
                  displayField: 'name',
                  queryMode: 'local',
                  listeners: Util.firstSelect(),
                  autoSelect: true,
                  selectOnFocus: true,
                  editable: false,
                  allowBlank:false,
                  fieldLabel: 'Item Type'+redStar
              }, {
                  layout: 'hbox',
                  xtype: 'container',
                  style: 'margin-bottom:5px; margin-left:10px',
                  items: [{
                      xtype: 'combo',
                      name: 'category_id',
                      store: 'combo.ItemCategory',
                      valueField: 'id',
                      displayField: 'name',
                      queryMode: 'local',
                      listeners: Util.firstSelect(),
                      autoSelect: true,
                      selectOnFocus: true,
                      allowBlank:false ,
                      fieldLabel: 'Category'+redStar,
                      width: 365
                  }, {
                      xtype: 'button',
                      name: 'btnCategory',
                      style: 'margin-left:5px',
                      text: '+',
                      action: 'AddCategory'
                  }]
              }, {
                  layout: 'hbox',
                  xtype: 'container',
                  style: 'margin-bottom:5px; margin-left:10px',
                  items: [{
                      xtype: 'combo',
                      name: 'um_id',
                      store: 'combo.UM',
                      valueField: 'id',
                      displayField: 'name',
                      queryMode: 'local',
                      listeners: Util.firstSelect(),
                      autoSelect: true,
                      selectOnFocus: true,
                      allowBlank:false,
                      fieldLabel: 'UM'+redStar,
                      width: 365
                  }, {
                      xtype: 'button',
                      name: 'btnUM',
                      style: 'margin-left:5px',
                      text: '+',
                      action: 'AddUM',
                  }]
              }, {
                  xtype: 'numberfield',
                  name: 'price',
                  allowBlank:false,
                  minValue:0 ,
                  fieldLabel: 'Price'+redStar,
              }, {
                  xtype: 'numberfield',
                  name: 're_order_point',
                  fieldLabel: 'Reorder Point'+redStar,
                  allowBlank:false ,
                  minValue: 0
              }, {
                  xtype: 'container',
                  layout: 'hbox',
                  items: [

                      {
                          // style: 'margin-left:115px',
                          xtype: 'checkbox',
                          name: 'is_use_serial',
                          boxLabel: 'Use Serial',
                          checkedValue: true,
                          uncheckedValue: false,
                          style: 'margin-left:100px'
                      }, {
                          xtype: 'checkbox',
                          name: 'status',
                          boxLabel: 'Active',
                          checkedValue: true,
                          uncheckedValue: false,
                          style: 'margin-left:20px'
                      },

                  ]

              },

            ]
        },
        // {
        //     xtype: "grid",
        //     title: "Item Price",
        //     height: 200,
        //     tools: [{
        //         xtype: 'button',
        //         iconCls: 'icon-add',
        //         tooltip: 'Add New Price',
        //         action: 'addItemPrice',
        //     }],
        //     border: true,
        //     plugins: Ext.create('Ext.grid.plugin.CellEditing', {
        //         clicksToEdit: 1
        //     }),
        //     style: 'border:1px solid silver',
        //     selModel: {
        //         selType: 'cellmodel'
        //     },
        //     columns: [{
        //         xtype: 'rownumberer',
        //         width: 50,
        //         align: 'center',
        //         text: 'No'
        //     }, {
        //         header: "UoM",
        //         flex:1,
        //         dataIndex: 'um_id',
        //         editor: {
        //             xtype: 'combo',
        //             store: 'combo.UM',
        //             valueField: 'id',
        //             displayField: 'name',
        //             queryMode: 'local',
        //             editable:false ,
        //             // triggerAction: 'all',
        //             // listeners: {
        //             //     select: function(combo, record, index) {
        //             //         var rec = record[0];
        //             //         App.app.getController("sale.Quotation").umRecord = rec;

        //             //     }
        //             // },
        //         },
        //         renderer:function(value){
        //             var store = App.app.getController("item.Item").getComboUMStore();
        //            var rec =  store.getById(value);
        //            if (rec) {
        //             return rec.get("name");
        //            };
        //            return '';
        //         }
        //     }, {
        //         flex:1,

        //         header: 'Multiplier',
        //         dataIndex: 'multiplier',
        //         field: {
        //             xtype: 'numberfield',
        //             name: 'price',
        //             minValue: 0,
        //         }
        //     }, {
        //         flex:1,
        //         header: 'Price',
        //         dataIndex: 'price',
        //         // renderer: 'usMoney',
        //         width: 120,
        //         field: {
        //             xtype: 'numberfield',
        //             name: 'price',
        //             minValue: 0,
        //         }
        //     }, {
        //         flex: 1,
        //         header: 'Remark',
        //         dataIndex:'remark',
        //         field:{
        //             xtype:'textarea',
        //             name:'remark',
        //         }
        //     }],
        //     store: 'item.ItemPrice'

        // },
        {
            xtype: 'container',
            layout: {
                type: 'table',
                columns: 2,
            },
            defaults: {
                width: 400,
                style: 'margin-left:10px',
            },
            items: [{
                xtype: 'textarea',
                name: 'purchase_description',
                fieldLabel: 'Purchase Description',
                style: 'margin-top:10px; margin-left:10px',
                // colspan: 2,
            }, {
                xtype: 'textarea',
                name: 'sale_description',
                fieldLabel: 'Sale Description',
                colspan: 2,
            }, {
                xtype: 'textarea',
                name: 'memo',
                fieldLabel: 'Memo',
                colspan: 2,
            }]
        }
    ]

});
