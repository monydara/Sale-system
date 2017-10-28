Ext.define('App.view.item.itemcategory.FmItemCategory', {
    extend:'Ext.window.Window',
    alias:'widget.FormItemCategory' ,	       
    modal:true,
    title:'Item Category',
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
            xtype: 'form',
            bodyPadding: 10,
            defaults:{
                    // allowBlank:false,
                    width: 400
            },

            items:[
                {
                    xtype: 'textfield',
                    name: 'name',
                    fieldLabel: 'Name',
                },
                {
                    xtype:'combo',
                    name:'sub_of_id',
                    store:'combo.ItemCategory',
                    valueField:'id',
                    displayField:'name',
                    queryMode:'local',
                    listeners:Util.firstSelect(),
                    autoSelect: true,
                    selectOnFocus:true,
                    fieldLabel:'Sub Of'
                },
                {
                    xtype: 'textfield',
                    name: 'remark',
                    fieldLabel: 'Remark',
                },
                {
                    layout: 'hbox',
                    xtype: 'container',
                    items:[
                        {
                            xtype: 'radiofield',
                            name: 'is_active',
                            fieldLabel: 'Status',
                            checked:true, 
                            inputValue:true ,
                            boxLabel:'<span style="color:blue ; font-weight:bold">Active </span>'
                        },{
                            style: 'margin-left:10px',
                            xtype: 'radiofield',
                            name: 'is_active',
                            inputValue:false ,

                            boxLabel:'<span style="color:red ; font-weight:bold">Deactive </span>'
                        }
                    ]
                    
                }
            ]
        }
    ]

});