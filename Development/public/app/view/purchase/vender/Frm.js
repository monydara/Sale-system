Ext.define('App.view.purchase.vender.Frm', {
    extend:'Ext.form.Panel',
    alias:'widget.venderForm' ,	       
    bodyPadding:20 ,
    border:true,
    autoScroll:true,
    title:'Vender Form',
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
        allowBlank:false,
    },
    defaultType:'textfield',
    items:[
        {
             xtype:'fieldset',
            title:'<b>Vender Info</b>', 
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
                    name:'name',
                    allowBlank:false,
                    fieldLabel:'Vender Name <span style="color:red">*</span>'

                },{
                    name:'legal_name',
                    allowBlank:false,
                    fieldLabel:'Legal Name <span style="color:red">*</span>'
                },{
                    name:'phone',
                    allowBlank:false,
                    fieldLabel:'Phone<span style="color:red">*</span>'
                },{
                    name:'mobile',
                    fieldLabel:'Mobile'
                },{
                    name:'email',
                    vtype:'email',
                    fieldLabel:'Email'
                },{
                    name:'Website',
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
            },
            defaultType:'textfield',
            items:[
                {
                    name:'contact_name',
                    fieldLabel:'Contact Name'
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