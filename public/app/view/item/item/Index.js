
Ext.define('App.view.item.item.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.itemIndex' ,

    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Item List</font>',
                 tools:[
                    {
                        xtype:'cTxtSearch'
                    },
                    // '->',
                    {
                      xtype:'cBtnAdd'
                    },{
                        xtype:'cBtnEdit'
                    }
                ],
                xtype:'grid',
                border:true,
                name:'index',
                store:'item.Item',
                columns: [{
                    header:'NO',
                    xtype:'rownumberer',
                    width:50,
                    align:'center',
                }, {
                    header:'Code',
                    width:100,
                    dataIndex:'code'
                }, {
                    header:'Barcode',
                    width:100,
                    dataIndex:'barcode'
                }, {
                    header:'Name',
                    width:200,
                    dataIndex:'name'
                }, {
                    header: 'Unit',
                    width:100,
                    dataIndex: 'um_name'
                }, {
                    header:'Item Type',
                    width:150,
                    dataIndex:'item_type_name'
                }, {
                    header:'Category',
                    width:150,
                    dataIndex:'category_name'
                }, {
                    header:'Price',
                    width:100,
                    dataIndex:'price',
                    renderer: function(value , cl , rec){
                        return App.conf.GlobalFn.currencyFormat(value , rec.get("currency_id"));

                    }
                },  {
                    header:'Currency',
                    width:100,
                    dataIndex:'currency_name',
                    //renderer: Ext.util.Format.usMoney
                }, {
                    header:'Reorder Point',
                    width:150,
                    dataIndex:'re_order_point'
                }, {
                    header:'Status',
                    flex:1,
                    dataIndex:'status',
                    renderer:function(val){
                      if (val) {
                        return "Active"
                      }else{
                        return "Deactive"
                      }
                    }
                }],
                bbar:{
                    xtype:'cPaging',
                    store:'item.Item',
                }
            },{
                xtype:'FormItem'
            }]
        });
        this.callParent(arguments);
    },




});
