
Ext.define('App.view.service.terminateMaintenance.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.terminateMaintenanceIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Terminated List</font>',
                 tools:[
                    {
                        // fieldLabel:'Search',                    
                        xtype:'textfield',
                        name:'Search',
                        emptyText:'-- Search Record --'
                    },
                    // '->',
                    {
                        xtype:'button',
                        action:'Terminate',
                        tooltip:'Terminate', 
                        style:'margin-left:5px',
                        iconCls:'icon-terminateAccount'
                    }
                ],
                xtype:'grid',
                Width: '100%',
                border:true,
                name:'index',
                store:'service.TerminateMaintenance',
                columns:[
                    {
                        header:'No', 
                        xtype:'rownumberer', 
                        width:50, 
                        align:'center'
                    }, {
                        header:'Maintenance No', 
                        width:150, 
                        dataIndex:'maintenance_no'
                    }, {
                        header: 'Customer',
                        width: 150,
                        dataIndex: 'customer_name',
                    }, {
                        header:'Invoice', 
                        width:150, 
                        // dataIndex:'date'
                    }, {
                        header:'From Date', 
                        width:100, 
                        dataIndex: 'start_date'
                    }, {
                        header:'To Date', 
                        width:100, 
                        dataIndex: 'end_date'
                    }, {
                        header:'Amount', 
                        width:100, 
                        dataIndex: 'amount'
                    }, {
                        header:'Status', 
                        width:100, 
                        dataIndex: 'status',
                        renderer: function(value) {
                            if(value == 0) {
                                return "<span style='color:red'><b>Terminated</b></span>";
                            } else if(value == 1) {
                                return "<span style='color:blue'><b>Active</b></span>";
                            };
                        }
                    }, {
                        header:'Remark', 
                        flex: 1, 
                        dataIndex: 'remark'
                    }
                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'service.TerminateMaintenance',
                    displayInfo: true,
                    displayMsg: 'view {0} - {1} of {2}',
                    emptyMsg: "view 0"
                })

            }, 
            // {
            //     xtype:'FormMaintenance'
            // }
        ]
        });
        this.callParent(arguments);
    },

});