Ext.define('App.view.setup.companyProfile.Index', {
    extend: 'Ext.form.Panel',
    alias: 'widget.companyProfileIndex',
    border: true,
    initComponent: function() {

        var me = this;

        Ext.apply(this, {
            items: [{
                    xtype: 'container',
                    flex: 1,
                    html: '<u>Company Profile</u>',
                    cls: 'title_form',

                }, {
                    layout: {
                        type: 'table',
                        columns: 2
                    },
                    border: true,
                    style: 'border: 1px solid gray; margin-left:10%; margin-top:5%; border-radius:5px',
                    width: 900,
                    bodyPadding: 20,
                    defaultType: 'textfield',
                    defaults: {
                        width: 400,
                        style: 'margin-left:10px',
                    },
                    items: [

                        {
                            name: 'legal_name',
                            fieldLabel: 'Legal Name<span style="color:red">*</span>',
                            allowBlank: false
                        }, {
                            xtype: 'form',
                            style: 'margin-left:10px',
                            width: 300,
                            items: [{
                                xtype: 'image',
                                // src: 'http://www.jpl.nasa.gov/spaceimages/images/mediumsize/PIA17011_ip.jpg',
                                width: 300,
                                height: 200,
                                name: 'image_file_name'
                            }],
                            rowspan: 7,
                            bbar: [{
                                xtype: 'filefield',
                                name: 'image',
                                width: 50,
                                buttonOnly: true,
                            }, '->', {
                                text: 'Remove',
                                action:'Remove'
                            }]
                        }, {
                            name: 'company_name',
                            fieldLabel: 'Company Name',
                        }, {
                            name: 'tax_no',
                            fieldLabel: 'Tax No.'
                        }, {
                            name: 'mobile',
                            fieldLabel: 'Mobile'
                        }, {
                            name: 'phone',
                            fieldLabel: 'Phone<span style="color:red">*</span>',
                            allowBlank: false
                        }, {
                            name: 'email',
                            vtype: 'email',
                            fieldLabel: 'Email'
                        }, {
                            name: 'website',
                            fieldLabel: 'Website'
                        },{
                            name:'bank_name',
                            fieldLabel:'Bank Name'
                        },{
                            name:'account_name',
                            fieldLabel:"Account Name"
                        }, {
                            name : 'account_no',
                            fieldLabel:'Account No'
                        },{
                            name : "vat_tin",
                            fieldLabel:'VAT TIN'
                        },{
                            xtype: 'textarea',
                            width: 810,
                            colspan: 2,
                            name: 'address',
                            fieldLabel: 'Address<span style="color:red">*</span>',
                            allowBlank: false
                        }

                    ],
                    buttons: [{
                        xtype:'cBtnSave'
                    }]
                }


            ]

        });
        this.callParent(arguments);


        me.down("textfield").focus(true, 200);
        Util.ajax("company_profile", {}, me.loadValueToForm, me)

    },
    loadValueToForm: function(obj, me) {
        if (obj.success) {
            me.getForm().setValues(obj.data);
            me.down('image').setSrc(obj.data.image_file_name);
        }
    }



});