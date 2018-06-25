Ext.define('App.view.sale.leadOpportunity.FmLead', {
    extend:'Ext.form.Panel',
    alias:'widget.FormLeadOpportunity' ,
    bodyPadding:20 ,
    border:true,
    autoScroll:true,
    // title:'Lead Opportunity Form',
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
                html: '<u>Lead Opportunity</u>',
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
                    xtype:'combo',
                    name:'oppunity_type',
                    store:["Sale", "Maintenance"],
                    allowBlank:false ,
                    fieldLabel:'Opportunity Type'+redStar,
                    value:'Sale' ,
                    editable:false ,
                },{
                    xtype:'combo',
                    name:'oppunity_to',
                    store:[ "Lead" , "Customer"],
                    allowBlank:false ,
                    fieldLabel:"Opportunity To"+redStar ,
                    editable:false,
                },{
                    xtype:'combo',
                    name:'status_id',
                    store:'combo.OpportunityStatus',
                    valueField:'id',
                    displayField:'name',
                    fieldLabel:'Status'+redStar,
                    editable:false ,
                    allowBlank:false

                },{
                    xtype:'combo',
                    name:'customer_id',
                    store:'combo.Customer',
                    forceSelection:true ,
                    fieldLabel:'Customer'+redStar,
                    valueField:'id',
                    queryMode:'remote',
                    minChars:4,
                    displayField:"name"
                },{
                    xtype:'combo',
                    name:'lead_id',
                    store:'combo.Lead',
                    fieldLabel:'Lead'+redStar,
                    hidden:true,
                    forceSelection:true ,
                    valueField:'id',
                    displayField:'name'
                },{
                    xtype:'checkbox',
                    name:'is_with_item',
                    fieldLabel:'With Item',
                },{
                    xtype:'combo',
                    name:'source_id',
                    valueField:'id',
                    displayField:'name',
                    store:'combo.Source',
                    fieldLabel:'Source'+redStar,
                    editable:false,
                    allowBlank:false ,

                }
            ]
        },{
            xtype:"grid",
            title:'Item Detail ',
            hidden:true,
            width:'100%',
            colspan:2 ,
            plugins: Ext.create('Ext.grid.plugin.CellEditing', {
                clicksToEdit: 1
            }),
            selModel: {
                selType: 'cellmodel'
            },
            store:'sale.LeadOppunityDetail',
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
                    field:{
                        xtype:'combo',
                        store:'combo.Item',
                        valueField:'id',
                        queryMode:'remote',
                        minChars:2,
                        displayField:'name'
                    },
                    renderer:function(value){
                        if (value ) {
                            var store = App.app.getController("sale.LeadOpportunity").getComboItemStore();
                            var rec = store.getById(value);
                            return rec.data.name;
                        }else{
                            return "";
                        };
                    }
                },{
                    text:'UOM',
                    dataIndex:'um_id',
                    field:{
                        xtype:'combo',
                        store:'combo.UM',
                        valueField:'id',
                        displayField:'name'
                    },
                    renderer:function(value){
                        var store = App.app.getController("sale.LeadOpportunity").getComboUMStore();
                        var rec = store.getById(value);
                        if (rec) {
                            return rec.data.name;
                        }else{
                            return ""
                        };

                    },
                    flex:0.3
                },{
                    text:'QTY',
                    dataIndex:'qty',
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
                                var ctrl = App.app.getController("sale.LeadOpportunity");

                                var rec = grid.getStore().getAt(rowIndex);
                                ctrl.deleteDetailRecord(grid, rec);
                            }
                        }
                    ]
                }

            ],
            height:200,

        },
        {
            xtype:'fieldset',
            title:'<b>Contact Info</b>',
            colspan:2 ,
            width:"100%" ,
            layout:{
                type:'table',
                columns:2
            },
            padding:10,
            defaults:{
                style:'margin-left:10px',
                // height:40,
                width:"98%",
                allowBlank:true,
                labelWidth:120,
            },
            defaultType:'textfield',
            items:[
                {
                    xtype:'container',
                    layout:'hbox',
                    items:[
                        {
                            name:'contact_id',
                            xtype:'combo',
                            store:'combo.Contact',
                            valueField:'id',
                            labelWidth:120,
                            minChars:2,
                            allowBlank:false ,
                            width:"95%" ,
                            queryMode:'remote',
                            displayField:'contact_name',
                            fieldLabel:'Contact Name'+redStar
                        },{
                            xtype:'button',
                            action:'AddContact',
                            iconCls:'icon-add',
                            tooltip:'Add new Contact'
                        }
                    ],

                },{
                    name:'contact_mobile',
                    readOnly:true ,
                    fieldLabel:'Contact Mobile'
                },{
                    name:'contact_id_card',
                    readOnly:true ,
                    fieldLabel:'Contact Id Card'
                },{
                    name:'contact_email',
                    readOnly:true ,
                    fieldLabel:'Contact Email'
                },{
                    name:'contact_address',
                    readOnly:true ,
                    fieldLabel:'Address'
                }

            ]
        },{
            xtype:'fieldset',
            title:'<b>Next Contact</b>',
            colspan:2 ,
            width:"100%" ,
            layout:{
                type:'table',
                columns:2
            },
            padding:10,
            defaults:{
                style:'margin-left:10px',
                // height:40,
                width:"98%",
                allowBlank:true,
                labelWidth:120,
            },
            defaultType:'textfield',
            items:[
               {
                    name:'next_contact_by',
                    xtype:'combo',
                    store:'combo.SaleRepresentative',
                    valueField:'id',
                    minChars:2,
                    width:"98%" ,
                    queryMode:'remote',
                    displayField:'name',
                    forceSelection:true,
                    fieldLabel:'Next Contact By'
                },{
                    name:'to_discuss',
                    xtype:'textarea',
                    rowspan:2,
                    fieldLabel:'To Dicuss'
                },{
                    name:'next_contact_date',
                    xtype:'datefield',
                    fieldLabel:'Next Contact Date',
                    format: 'd-m-Y',
                    altFormat: 'Y-m-d',
                    submitFormat: 'Y-m-d',

                },

            ]
        }

    ]

});
