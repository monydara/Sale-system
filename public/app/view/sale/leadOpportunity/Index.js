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
                bbar:{
                    xtype:'cPaging',
                     store:'sale.LeadOpportunity',
                },

            },{
                xtype:'FormLeadOpportunity'
            }
        ]
        });
        this.callParent(arguments);
    },




});
