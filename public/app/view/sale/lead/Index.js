
Ext.define('App.view.sale.lead.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.leadIndex' ,

    border:true,

    layout:'card',
    initComponent:function () {
        Ext.apply(this, {
            items:[

            {
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Lead List</font>',
                 

            xtype: 'tabpanel',
            width: 1000,
            height: 600,
            items: [
            {
                title: 'Infomation',
                name: 'info',
                items: [{
                xtype: 'grid',
                border: true,
                height:400,
                name:'index',
                autoScroll: true,
                style: 'border:1px solid silver;margin-top:10px',
                selModel: {
                    selType: 'rowmodel'
                },
                viewConfig: {
                    getRowClass: function(record, id) {
                        return record.get("_destroy") == true ? "hidden" : "row-error";
                    }
                },
                features: [{
                    ftype: 'grouping',
                    groupField: 'status_name',
                    groupHeaderTp1: '{name} ({rows.length} Item{[values.rows.length > 1 ? "s" : ""]})',
                }],

                 store:'sale.LeadInfomation',
                 viewConfig: {
                  enableTextSelection: true
                },
               tbar: [
                    // {
                    //     xtype: 'fieldset',
                    //     title: '<b>Advance Search</b>',
                    //     layout:{
                    //         type: 'table',
                    //         columns: 3
                    //     },

                    // items:[{
                    //         xtype: 'combo',
                    //         name: '',
                    //         store: ["Lead Name", "Lead Code", "Lead Area", "Lead Source", "Lead Phone", "Lead Owner", "Lead Status", "Legal Name"],
                    //         editable: false,
                    //         valueField: 'id',
                    //         style:'margin-left:10px',
                    //         displayField: 'name',

                    //         },{
                    //             xtype: 'combo',
                    //             name: '',
                    //             store: ["Lead Name", "Lead Code", "Lead Area", "Lead Source", "Lead Phone", "Lead Owner", "Lead Status", "Legal Name"],
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',
                    //             style:'margin-left:10px',

                    //         } ,{
                    //             xtype: 'combo',
                    //             name: '',
                    //             store: ["Lead Name", "Lead Code", "Lead Area", "Lead Source", "Lead Phone", "Lead Owner", "Lead Status", "Legal Name"],
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',
                    //             style:'margin-left:10px'
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'status1',
                    //             store:'combo.LeadStatus', 
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',
                    //             style:'margin-left:10px',
                    //             hidden: true,
                    //             listeners : {
                    //                 'select' : function(combo) {
                                        
                    //                 }
                    //             }
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'status2',
                    //             store: 'combo.LeadStatus',
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',
                    //             style:'margin-left:10px',
                    //              hidden: true
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'status3',
                    //             store:'combo.LeadStatus',
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',
                    //             style:'margin-left:10px',
                    //              hidden: true
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'source1',
                    //             store: 'combo.Source',
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',
                    //             style:'margin-left:10px'
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'source2',
                    //             store: 'combo.Source',
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',  
                    //             style:'margin-left:10px'
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'source3',
                    //             store: 'combo.Source',
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',  
                    //             style:'margin-left:10px'
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'lead_owner1',
                    //             store: 'combo.SaleRepresentative',
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',  
                    //             style:'margin-left:10px'
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'lead_owner2',
                    //             store: 'combo.SaleRepresentative',
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',  
                    //             style:'margin-left:10px'
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'lead_owner3',
                    //             store: 'combo.SaleRepresentative',
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',  
                    //             style:'margin-left:10px'
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'Lead_area1',
                    //             store: 'combo.Area',
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',  
                    //             style:'margin-left:10px'
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'Lead_area2',
                    //             store: 'combo.Area',
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',  
                    //             style:'margin-left:10px'
                    //         },{
                    //             xtype: 'combo',
                    //             name: 'Lead_area3',
                    //             store: 'combo.Area',
                    //             editable: false,
                    //             valueField: 'id',
                    //             displayField: 'name',  
                    //             style:'margin-left:10px'
                    //         },{
                    //             xtype: 'textfield',
                    //             name: 'name1',  
                    //             style:'margin-left:10px',
                    //              hidden: true
                    //         },{
                    //             xtype: 'textfield',
                    //             name: 'name2',  
                    //             style:'margin-left:10px',
                    //             hidden: true
                        
                    //         },{
                    //             xtype: 'textfield',
                    //             name: 'name3',  
                    //             style:'margin-left:10px',
                    //             hidden: true
      
                    //         },{
                    //             xtype: 'textfield',
                    //             name: 'code1',  
                    //             style:'margin-left:10px',
                    //             hidden: true
                    //         },{
                    //             xtype: 'textfield',
                    //             name: 'code2',  
                    //             style:'margin-left:10px',
                    //             hidden: true
                    //         },{
                    //             xtype: 'textfield',
                    //             name: 'code3',  
                    //             style:'margin-left:10px',
                    //             hidden: true
                    //         },{
                    //             xtype: 'textfield',
                    //             name: 'phone1',  
                    //             style:'margin-left:10px',
                    //             hidden: true
                    //         },{
                    //             xtype: 'textfield',
                    //             name: 'phone2',  
                    //             style:'margin-left:10px',
                    //             hidden: true
                    //         },{
                    //             xtype: 'textfield',
                    //             name: 'phone3',  
                    //             style:'margin-left:10px',
                    //             hidden: true
                    //         }]

                    // }
                    ,'->',{
                        xtype:'button',
                        action: 'advance_search',
                        style: 'margin-left:10px',
                        iconCls: 'icon-search',
                        tooltip: 'Advance Search'
                    },{
                        action:'Add_lead_infomation',
                        xtype:'button',
                        style:'margin-left:5px',
                        iconCls:'icon-add',
                        tooltip:'Add New Lead'
                    },{
                        xtype:'button',
                        action:'Edit_lead_infomation',
                        tooltip:'Edit Lead',
                        style:'margin-left:5px',
                        iconCls:'icon-edit'
                    }
                ],
                columns: [
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                    {header:'Code', dataIndex:'code' , width:80, locked:true,},
                    {header:'Name ',width:150,dataIndex:'name', locked:true,},
                    {header:'Source ',width:150,dataIndex:'source_name', locked:true,},
                    {header:'Lead Owner',width:150,dataIndex:'leadowner'},
                    {header:'Created By',width:150,dataIndex:'username'},
                    {header:'Legal Name',width:150,dataIndex:'legal_name'},
                    {header:'Phone',width:150,dataIndex:'phone'},
                    {header:'Contact',width:150,dataIndex:'contact_name'},
                    {header:'Contact Phone',width:150,dataIndex:'contact_mobile'},
                    {header:'Area',width:150, dataIndex:'area_name'},
                    {header:'Status', width:150, dataIndex:'status_name'}
                ],
                 bbar:{
                    xtype:'cPaging',
                     store: 'sale.LeadInfomation',
                 },

                 listeners: {
                        itemclick: function(dv, record, item, index, e){
                            var ctr = App.app.getController("sale.Lead");
                            ctr.SelectLeadPurpose(dv, record, item, index, e);
                        }
                    },
                },{
                    xtype: 'grid',
                    store:'sale.LeadPurpose',
                    style: 'border:1px solid silver;margin-top:10px',
                    
                    columns: [
                    {header:'Lead Purpose ',flex:1,dataIndex:'lead_purpose'},
                    ],
                    
                }],
            },
            {
                title: 'Direct Sale',
                items: [{
                xtype: 'grid',
                border: true,
                height:400,
                name:'index',
                autoScroll: true,
                style: 'border:1px solid silver;margin-top:10px',
                selModel: {
                    selType: 'rowmodel'
                },
                viewConfig: {
                    getRowClass: function(record, id) {
                        return record.get("_destroy") == true ? "hidden" : "row-error";
                    }
                },
                features: [{
                    ftype: 'grouping',
                    groupField: 'status_name',
                    groupHeaderTp1: '{name} ({rows.length} Item{[values.rows.length > 1 ? "s" : ""]})',
                }],

                 store:'sale.LeadDirectsale',
                 viewConfig: {
                  enableTextSelection: true
                },
              tbar: [,'->',{
                        xtype:'button',
                        action: 'advance_search_direct_sale',
                        style: 'margin-left:5px',
                        iconCls: 'icon-search',
                        tooltip: 'Advance Search'
                    },
                    {
                        action:'Add_lead_direct_sale',
                        xtype:'button',
                        style:'margin-left:5px',
                        iconCls:'icon-add',
                        tooltip:'Add New Lead'
                    },{
                        xtype:'button',
                        action:'Edit_lead_direct_sale',
                        tooltip:'Edit Lead',
                        style:'margin-left:5px',
                        iconCls:'icon-edit'
                    }
                ],
                columns: [
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                    {header:'Code', dataIndex:'code' , width:80, locked:true,},
                    {header:'Name ',width:150,dataIndex:'name', locked:true,},
                    {header:'Source ',width:150,dataIndex:'source_name', locked:true,},
                    {header:'Lead Owner',width:150,dataIndex:'leadowner'},
                    {header:'Created By',width:150,dataIndex:'username'},
                    {header:'Legal Name',width:150,dataIndex:'legal_name'},
                    {header:'Phone',width:150,dataIndex:'phone'},
                    {header:'Contact',width:150,dataIndex:'contact_name'},
                    {header:'Contact Phone',width:150,dataIndex:'contact_mobile'},
                    {header:'Area',width:150, dataIndex:'area_name'},
                    {header:'Status', width:150, dataIndex:'status_name'}
                ],
                 bbar:{
                    xtype:'cPaging',
                     store: 'sale.LeadDirectsale',
                 },
                 listeners: {
                        itemclick: function(dv, record, item, index, e){
                            var ctr = App.app.getController("sale.Lead");
                            ctr.SelectLeadPurpose(dv, record, item, index, e);
                        }
                    },
                },{
                    xtype: 'grid',
                    store:'sale.LeadPurpose',
                    style: 'border:1px solid silver;margin-top:10px',
                    
                    columns: [
                    {header:'Lead Purpose ',flex:1,dataIndex:'lead_purpose'},
                    ],
                    
                }],
                
            }, {
                title: 'Website',
                items: [{
                xtype: 'grid',
                border: true,
                name:'index',
                height:400,
                autoScroll: true,
                style: 'border:1px solid silver;margin-top:10px',
                viewConfig: {
                    getRowClass: function(record, id) {
                        return record.get("_destroy") == true ? "hidden" : "row-error";
                    }
                },
                 features: [{
                    ftype: 'grouping',
                    groupField: 'status_name',
                    groupHeaderTp1: '{name} ({rows.length} Item{[values.rows.length > 1 ? "s" : ""]})',
                }],
                 store:'sale.LeadWebsite',
                
                columns: [
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                    {header:'Code', dataIndex:'code' , width:80, locked:true,},
                    {header:'Name ',width:150,dataIndex:'name', locked:true,},
                    {header:'Source ',width:150,dataIndex:'source_name', locked:true,},
                    {header:'Lead Owner',width:150,dataIndex:'leadowner'},
                    {header:'Created By',width:150,dataIndex:'username'},
                    {header:'Legal Name',width:150,dataIndex:'legal_name'},
                    {header:'Phone',width:150,dataIndex:'phone'},
                    {header:'Contact',width:150,dataIndex:'contact_name'},
                    {header:'Contact Phone',width:150,dataIndex:'contact_mobile'},
                    {header:'Area',width:150, dataIndex:'area_name'},
                    {header:'Status', width:150, dataIndex:'status_name'}
                ],
                 bbar:{
                    xtype:'cPaging',
                     store: 'sale.LeadWebsite',
                 } ,
                 listeners: {
                        itemclick: function(dv, record, item, index, e){
                            var ctr = App.app.getController("sale.Lead");
                            ctr.SelectLeadPurpose(dv, record, item, index, e);
                        }
                    },
                },{
                    xtype: 'grid',
                    store:'sale.LeadPurpose',
                    style: 'border:1px solid silver;margin-top:10px',
                    columns: [
                    {header:'Lead Purpose ',flex:1,dataIndex:'lead_purpose'},
                    ],
                }]
                
            }, {
                title: 'Lead History',
                items: [
                {
                xtype: 'grid',
                border: true,
                name:'index',
                height:400,
                autoScroll: true,
                // title: 'Lead History',
                style: 'border:1px solid silver;margin-top:10px',
                viewConfig: {
                    getRowClass: function(record, id) {
                        return record.get("_destroy") == true ? "hidden" : "row-error";
                    }
                },
                 features: [{
                    ftype: 'grouping',
                    groupField: 'status_name',
                    groupHeaderTp1: '{name} ({rows.length} Item{[values.rows.length > 1 ? "s" : ""]})',
                }],
                 store:'sale.Lead',
                 tbar: [,'->',{
                        xtype:'button',
                        action: 'advance_search_lead_history',
                        style: 'margin-left:5px',
                        iconCls: 'icon-search',
                        tooltip: 'Advance Search'
                    },
                    {
                        xtype:'cBtnAdd'
                    },{
                         xtype:'cBtnEdit'
                    }
                ],
                columns: [
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},
                    {header:'Code', dataIndex:'code' , width:80, locked:true,},
                    {header:'Name ',width:150,dataIndex:'name', locked:true,},
                    {header:'Source ',width:150,dataIndex:'source_name', locked:true,},
                    {header:'Lead Owner',width:150,dataIndex:'leadowner'},
                    {header:'Created By',width:150,dataIndex:'username'},
                    {header:'Legal Name',width:150,dataIndex:'legal_name'},
                    {header:'Phone',width:150,dataIndex:'phone'},
                    {header:'Contact',width:150,dataIndex:'contact_name'},
                    {header:'Contact Phone',width:150,dataIndex:'contact_mobile'},
                    {header:'Area',width:150, dataIndex:'area_name'},
                    {header:'Status', width:150, dataIndex:'status_name'}
                ], 
                bbar:{
                    xtype:'cPaging',
                    store: 'sale.Lead',
                },
                listeners: {
                        itemclick: function(dv, record, item, index, e){
                            var ctr = App.app.getController("sale.Lead");
                            ctr.SelectLeadPurpose(dv, record, item, index, e);
                        }
                    },

                },{
                    xtype: 'grid',
                    store:'sale.LeadPurpose',
                    style: 'border:1px solid silver;margin-top:10px',
                    
                    columns: [
                    {header:'Lead Purpose ',flex:1,dataIndex:'lead_purpose'},
                    ],
                    
                }],
                
               
            },  




            ],
   
            },{
                xtype:'FormLead'
            },{
                xtype:'FormLeadDirectSale'
            },{
                xtype:'FormLeadInfomation'
            }
        ]
        });
        this.callParent(arguments);
    },




});
