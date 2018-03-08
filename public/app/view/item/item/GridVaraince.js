
Ext.define('App.view.item.item.GridVaraince', {
    extend:'Ext.grid.Panel',
    alias:'widget.gridVaraince' ,
    border:true,
    initComponent:function () {
        Ext.apply(this, {
          plugins: Ext.create('Ext.grid.plugin.CellEditing', {
              clicksToEdit: 1
          }),
          style: 'border:1px solid silver',
          selModel: {
              selType: 'cellmodel'
          },
            border:true,
            name:'index',
            store:'item.ItemSKU',
            columns: [
              {
                header:'Code',
                dataIndex:'code'
              },{
                header:'Cost',
                dataIndex:'cost',
                editor:{
                  xtype:'numberfield',
                  minValue:0 ,
                  value: 0
                }
              },{
                header:'Price',
                dataIndex:'price',
                editor:{
                  xtype:'numberfield',
                  minValue:0 ,
                  value: 0
                }

              }

            ],

        });
        this.callParent(arguments);
    },




});
