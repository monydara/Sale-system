Ext.define('App.view.sale.lead.FmLead', {
    extend: 'Ext.form.Panel',
    alias: 'widget.FormLead',
    bodyPadding: 20,
    border: true,
    autoScroll: true,
    title: 'Lead Form',
    buttons: [
        '->',

        {
            text: 'Save',
            iconCls: 'icon-save',
            action: 'Save'
        }, {
            text: 'Cancel',
            action: 'Cancel',
            iconCls: 'icon-cancel'
        }
    ],

    layout: {
        type: 'table',
        columns: 2

    },
    defaults: {
        style: 'margin-left:10px',
        // height:40,
        width: 400,
    },
    defaultType: 'textfield',
    items: [{
            xtype: 'fieldset',
            title: '<b>Lead Info</b>',
            colspan: 2,
            width: 850,
            padding: 10,
            layout: {
                type: 'table',
                columns: 2
            },
            defaults: {
                style: 'margin-left:10px',
                // height:40,
                width: 400,
                allowBlank: true,
            },
            defaultType: 'textfield',
            items: [{
                    name: 'name',
                    allowBlank: false,
                    fieldLabel: 'Lead Name' + redStar
                }, {
                    name: 'legal_name',
                    allowBlank: false,
                    fieldLabel: 'Legal Name' + redStar
                }, {
                    xtype: 'textfield',
                    name: 'industry',
                    allowBlank: true,
                    maxLength: 100,
                    fieldLabel: 'Industry',

                }, {
                    xtype: 'combo',
                    name: 'lead_area_id',
                    store: 'combo.Area',
                    editable: false,
                    valueField: 'id',
                    displayField: 'name',
                    listeners: Util.firstSelect(),
                    allowBlank: false,
                    fieldLabel: 'Lead Area' + redStar
                }, {
                    xtype: 'combo',
                    fieldLabel: 'Status' + redStar,
                    allowBlank: false,
                    editable: false,
                    store: "combo.LeadStatus",
                    valueField: 'id',
                    displayField: 'name',
                    name: 'status'
                }, {

                    name: 'phone',
                    fieldLabel: 'Phone'
                }, {
                    xtype: 'combo',
                    name: 'source_name',
                    store: 'combo.Source',
                    valueField: 'id',
                    displayField: 'name',
                    editable: false,
                    allowBlank: false,
                    fieldLabel: 'Lead Source' + redStar
                }, {
                    xtype: 'combo',
                    name: 'lead_owner',
                    store: 'combo.SaleRepresentative',
                    fieldLabel: 'Lead Owner' + redStar,
                    queryMode: 'remote',
                    allowBlank: false,
                    minChars: 2,
                    valueField: 'id',
                    displayField: 'name'
                }, {
                    xtype: 'combo',
                    name: 'next_contact_by',
                    store: 'combo.SaleRepresentative',
                    valueField: 'id',
                    displayField: 'name',
                    fieldLabel: 'Next Contact By'
                }, {
                    xtype: 'datefield',
                    name: 'next_contact_date',
                    fieldLabel: 'Next Contact Date',
                    format: 'd-m-Y',
                    altFormat: 'd-m-Y',
                    submitFormat: 'd-m-Y',

                },

                {
                    name: 'mobile',
                    fieldLabel: 'Mobile'
                }, {
                    name: 'email',
                    vtype: 'email',
                    fieldLabel: 'Email'
                }, {
                    name: 'website',
                    fieldLabel: 'Website'
                }, {
                    xtype: 'textarea',
                    name: 'address',
                    fieldLabel: 'Address',
                    colspan: 2,
                    width: 810
                },
            ]
        }, {
            xtype: 'fieldset',
            title: '<b>Lead Purpose</b>',
            colspan: 2,
            width: 850,
            padding: 10,

            layout: {
                type: 'table',
                columns: 2
            },
            defaults: {
                style: 'margin-left:10px',
                // height:40,
                width: 400,
                allowBlank: true,
            },
            defaultType: 'textfield',
            items: [

                {
                    xtype: 'textarea',
                    name: 'lead_purpose',
                    fieldLabel: 'Lead Purpose' + redStar,
                    allowBlank: false,
                    colspan: 2,
                    width: 810
                },
            ]

        }, {
            xtype: 'fieldset',
            title: '<b>Contact Info</b>',
            colspan: 2,
            width: 850,
            padding: 10,

            layout: {
                type: 'table',
                columns: 2
            },
            defaults: {
                style: 'margin-left:10px',
                // height:40,
                width: 400,
                allowBlank: true,
            },
            defaultType: 'textfield',
            items: [{
                    xtype: 'container',
                    layout: 'hbox',
                    items: [{
                        name: 'contact_id',
                        xtype: 'combo',
                        store: 'combo.Contact',
                        valueField: 'id',
                        minChars: 2,
                        allowBlank: false,
                        width: 375,
                        queryMode: 'remote',
                        displayField: 'contact_name',
                        fieldLabel: 'Contact Name' + redStar
                    }, {
                        xtype: 'button',
                        action: 'AddContact',
                        iconCls: 'icon-add',
                        tooltip: 'Add new Contact'
                    }],

                }, {
                    name: 'contact_mobile',
                    readOnly: true,
                    fieldLabel: 'Contact Mobile'
                }, {
                    name: 'contact_id_card',
                    readOnly: true,
                    fieldLabel: 'Contact Id Card'
                }, {
                    name: 'contact_email',
                    readOnly: true,
                    fieldLabel: 'Contact Email'
                }, {
                    name: 'contact_address',
                    readOnly: true,
                    fieldLabel: 'Address'
                }

            ]
        }

    ]

});