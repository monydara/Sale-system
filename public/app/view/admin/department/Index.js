Ext.define('App.view.admin.department.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.departmentIndex',
    bodyPadding: 10,
    border: true,
    layout: 'card',
    initComponent: function() {
        Ext.apply(this, {
            items: [

                {
                    xtype: 'grid',
                    border: true,
                    name: 'index',
                    store: 'admin.Department',
                    title: '<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" >Department Management</font>',

                    tools: [

                        {
                            xtype:'cBtnAdd'
                        }, {
                            xtype:'cBtnEdit'
                        }
                    ],
                    columns: [{
                            header: 'NO',
                            xtype: 'rownumberer',
                            width: 50,
                            align: 'center'
                        },{
                            header:'Department',
                            dataIndex:'name',
                            width:200
                        },{
                            header:'Description',
                            dataIndex:'description',
                            flex:1
                        }
                    ],
                    bbar:{
                        xype:'cPaging' ,
                        store: 'admin.Department',
                    }


                },
            ]
        });
        this.callParent(arguments);
    },



});
