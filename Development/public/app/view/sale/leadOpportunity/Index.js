Ext.define('App.view.sale.leadOpportunity.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.leadOpportunityIndex' ,
    border:true,
    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Lead Opportunity List</font>',
                tools:[
                    {
                        fieldLabel:'Search',
                        xtype:'textfield',
                        name:'Search',
                        emptyText:'-- Search Record --'
                    },
                    // '->',
                    {
                        action:'Add',
                        xtype:'button',
                        style:'margin-left:5px',
                        iconCls:'icon-add',
                        tooltip:'Add New Lead'
                    },{
                        xtype:'button',
                        action:'Edit',
                        tooltip:'Edit Lead',
                        style:'margin-left:5px',
                        iconCls:'icon-edit'
                    }
                ],
                xtype:'grid',
                border:true,
                name:'index',
                store:'sale.LeadOpportunity',
                    viewConfig: {
                    enableTextSelection: true
                },
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                    {header:'Code', dataIndex:'code' , width:80},
                    {header:'Quotation To', dataIndex:'oppunity_to',},
                    {header:'Name ',width:150,dataIndex:'customer_name'},
                    {header:'Create Date',width:150,dataIndex:'created_at',
                         renderer: Ext.util.Format.dateRenderer('d-M-Y')
                    },
                    {header:'Next Contact By',width:150,dataIndex:'next_contact_by_name'},
                    {header:'Next Contact Date',flex:1,dataIndex:'next_contact_date',
                        renderer: Ext.util.Format.dateRenderer('d-M-Y')
                    },
                    {header:'Status',width:90, dataIndex:'status_name'}

                ],
                bbar:Ext.create('Ext.PagingToolbar', {
                    store:'sale.LeadOpportunity',
                    displayInfo: true,
                    displayMsg: 'view {0} - {1} of {2}',
                    emptyMsg: "view 0"
                })

            },{
                xtype:'FormLeadOpportunity'
            }
        ]
        });
        this.callParent(arguments);
    },




});
