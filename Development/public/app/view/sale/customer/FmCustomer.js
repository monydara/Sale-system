Ext.define('App.view.sale.customer.FmCustomer', {
    extend:'Ext.form.Panel',
    alias:'widget.FormCustomer' ,
    bodyPadding:20 ,
    border:true,
    autoScroll:true,
    title:'Custmer Form',
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

    layout:{
        type:'table',
        columns:2

    },
    defaults:{
        style:'margin-left:10px',
        // height:40,
        width:400,

    },
    defaultType:'textfield',
    items:[
        {
             xtype:'fieldset',
            title:'<b>Customer Info</b>',
            colspan:2 ,
            width:850 ,
            padding:10,
            layout:{
                type:'table',
                columns:2
            },
            defaults:{
                style:'margin-left:10px',
                // height:40,
                width:400,
                allowBlank:true,
              labelWidth:120,
            },
            defaultType:'textfield',
            items:[
                {
                    xtype:'combo',
                    name:'lead_id',
                    store:'combo.Lead',
                    valueField:'id',
                    displayField:'code',
                    fieldLabel:'From Lead',
                    queryMode:'remote',
                    minChars:2,
                    emptyText:'Type Lead Code Here',
                    tooltip:'Convert lead to customer',
                    colspan:2

                },
                {
                    name:'name',
                    allowBlank:false,
                    fieldLabel:'Customer Name'+redStar
                },{
                    name:'legal_name',
                    allowBlank:false,
                    fieldLabel:'Legal Name'+redStar
                },{
                    xtype:'combo',
                    name:'customer_type',
                    allowBlank:false,
                    store:['Individual','Company'],
                    value:'Individual',
                    fieldLabel:'Customer Type',

                },{
                  xtype:'combo' ,
                  name:'custom_price_id' ,
                  store:'combo.CustomPrice',
                  valueField:'id',
                  displayField:'name',
                  fieldLabel:'Custom Price'+redStar,
                  queryMode:'remote',
                  minChars:2,
                   listeners:Util.firstSelect(),
                  autoSelect: true,
                  allowBlank:false,
                  selectOnFocus:true,


                },{
                    xtype:'combo',
                    name:'customer_area_id',
                    store:'combo.Area',
                    valueField:'id',
                    displayField:'name',
                    queryMode:'remote',
                    minChars:2,
                     listeners:Util.firstSelect(),
                    autoSelect: true,
                    allowBlank:false,
                    selectOnFocus:true,
                    fieldLabel:'Customer Area'+redStar
                },{
                    name:'vat_tin',
                    fieldLabel:"VAT TIN"
                },{
                    name:'phone',
                    fieldLabel:'Phone'
                },{
                    name:'mobile',
                    fieldLabel:'Mobile'
                },{
                    name:'email',
                    vtype:'email',
                    fieldLabel:'Email'
                },{
                    name:'website',
                    fieldLabel:'Website'
                },{
                    xtype:'textarea',
                    name:'address',
                    fieldLabel:'Address',
                    colspan: 2,
                    width: 810
                },
            ]
        },
        {
            xtype:'fieldset',
            title:'<b>Contact Info</b>',
            colspan:2 ,
            width:850 ,
            padding:10,

            layout:{
                type:'table',
                columns:2
            },
            defaults:{
                style:'margin-left:10px',
                // height:40,
                width:400,
                allowBlank:true,
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
                            minChars:2,
                            allowBlank:false ,
                            width:375 ,
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
                    fieldLabel:'Contact Mobile'
                },{
                    name:'contact_id_card',
                    fieldLabel:'Contact Id Card'
                },{
                    name:'contact_email',
                    fieldLabel:'Contact Email'
                },{
                    name:'contact_address',
                    fieldLabel:'Address'
                }

            ]
        }

    ]

});
