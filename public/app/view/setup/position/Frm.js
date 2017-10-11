Ext.define('App.view.setup.position.Frm', {
    extend:'Ext.window.Window',
    alias:'widget.frmPosition' ,	       
    modal:true,
    title:'Position Form',
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
    items:[
        {
            xtype:'form',
            bodyPadding: 20 , 
            defaults:{
                
                width: 400
            },
            items:[
                {
                    xtype:'textfield',
                    allowBlank:false,
                    name:'name',
                    fieldLabel:'Position'
                },{
                    xtype:'textarea',
                    name:'description',
                    fieldLabel:'Description'
                } 
            ]
        }
    ]

});