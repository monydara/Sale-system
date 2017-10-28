Ext.define('App.view.admin.role.Index', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.roleIndex',
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
                    store: 'admin.Role',
                    title: '<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" >Role Management</font>',

                    tools: [

                        {
                            xtype: 'cBtnAdd'
                        }, {
                            xtype: 'cBtnEdit'
                        }, {
                            xtype: 'button',
                            action: 'ApplyPermission',
                            style: 'margin-left:5px',
                            iconCls: 'icon-applyPermission',
                            tooltip: 'Apply extjs Permission'
                        }
                    ],
                    columns: [{
                            header: 'NO',
                            xtype: 'rownumberer',
                            width: 50,
                            align: 'center'
                        },{
                            header:'Role',
                            dataIndex:'name',
                            width:200
                        },{
                            header:'Description',
                            dataIndex:'description',
                            flex:1
                        }
                    ],
                    bbar:{
                        xtype:'cPaging' ,
                        store:'admin.Role',
                    }


                },
            ]
        });
        this.callParent(arguments);
    },



});
