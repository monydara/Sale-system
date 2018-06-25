Ext.define('App.view.sale.saleRepresentative.Frm', {
    extend: 'Ext.form.Panel',
    alias: 'widget.saleRepresentativeForm',
    bodyPadding: 20,
    border: true,
    autoScroll: true,
    buttons: [
        '->',

        {
           xtype:'cBtnSave'
        }, {
            xtype:'cBtnCancel'
        }
    ],
    items: [{
            xtype: 'container',
            layout: 'hbox',
            items: [{
                xtype: 'container',
                flex: 1,
                html:'<u>Sale Representative</u>', 
                cls:'title_form'

            }]
        }, {
            xtype: 'cFieldSet',
            // autoScroll: true,
            // title: '<b> Sale Information </b>',
            // padding: 10,
            // layout: {
            //     type: 'table',
            //     columns: 2
            // },
            // defaults: {
            //     width: 400,
            //     style: 'margin-left: 10px'
            // },
            defaultType:'textfield',
            items: [
                {
                    name:'first_name',
                    fieldLabel:'First Name<span style="color:red">*</span>',
                    allowBlank:false,
                },{
                    name:'last_name',
                    fieldLabel:'Last Name<span style="color:red">*</span>',
                    allowBlank:false
                },{
                    name:'mobile',
                    fieldLabel:'Mobile'
                },{
                    name:'phone',
                    fieldLabel:'Phone'
                },{
                    name:'email',
                    fieldLabel:'Email',
                    vtype:'email'
                },{
                    xtype:'datefield',
                    fieldLabel:'Reg. Date',
                    name:'register_date',
                    value:new Date() ,
                    submitFormat:'Y-m-d',
                    format:'m-d-Y'
                },{
                    xtype:'combo',
                    name:'position_id',
                    valueField:'id',
                    store:'combo.Position',
                    displayField:'name',
                    fieldLabel:'Position<span style="color:red">*</span>',
                    allowBlank:false,
                    editable:false,
                    queryMode:'local'
                },{
                    xtype:'container',
                    layout:'hbox',
                    // colspan:2 ,

                    items:[
                        {
                            xtype:'radiofield',
                            name:'status',
                            inputValue:'A',
                            fieldLabel:'Status',
                            checked:true,
                            boxLabel:'<span style="color:gree"> Ative</span>'
                        },{
                            xtype:'radiofield',
                            name:"status",
                            inputValue:'D',
                            style:'margin-left:10px',
                            boxLabel:'<span style="color:red"> Deative</span>'

                        }
                    ]
                },{
                    xtype:'textarea',
                    colspan:2 ,
                    fieldLabel:'Address',
                    // width:800 , 
                    name:'address'
                },{
                    xtype:'textarea',
                    colspan:2 , 
                    // width:800 , 
                    fieldLabel:'Remark',
                    name:'remark'
                }
            ]
        },

    ]



});