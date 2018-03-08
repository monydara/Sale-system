Ext.define('App.view.item.item.FMVariance', {
    extend:'Ext.form.Panel',
    alias:'widget.fmItemVariance' ,

    initComponent:function () {
        Ext.apply(this, {
            items:[
              {
                xtype:'cBtnAdd',
                action:'AddItemVariance'
              },
              this.getItemOption(1),
              

            ],
            bbar:[
              {
                text:'Generate' ,
                action:'GenerateItem'
              }
            ]
        });
        this.callParent(arguments);
    },
    getItemOption:function(index ) {


          var combo = {
            xtype:'panel',
            layout:'hbox',
            items:[
              {
                xtype:'textfield',
                name:'option_name|'+index ,
                fieldLabel:'Option'
              },
              {
                xtype: 'tagfield',
                forceSelection: false,
                triggerOnClick: false,
                createNewOnEnter: true,
                width: 500,
                store:  Ext.create('Ext.data.Store',{
                        fields: ['value'],
                        data: []
                    }),
                valueField: 'value',
                displayField:'value',
                name: 'value|'+index ,
                fieldLabel:'Value',
                queryMode: 'local',
                forceSelection: false,
                triggerOnClick: false,

              }
            ]
          };


          return combo ;



    }
  });
