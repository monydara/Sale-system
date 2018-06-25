
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
            title:'Item Detail ',

            store:'item.ItemSKU',
            columns: [
              {
                header:'Code',
                dataIndex:'code',
                width: 300
              },{
                header:'Cost',
                dataIndex:'cost',
                width: 100 ,
                editor:{
                  xtype:'numberfield',
                  minValue:0 ,
                  value: 0
                }
              },{
                header:'Price',
                dataIndex:'price',
                width: 100 ,
                editor:{
                  xtype:'numberfield',
                  minValue:0 ,
                  value: 0
                }

              },{
                  header: 'Action',
                  minWidth: 100,
                  flex: 1,
                  align: 'center',
                  xtype: 'actioncolumn',
                  items: [{
                      xtype: 'button',
                      iconCls: 'icon-delete',
                      handler: function(grid, rowIndex) {
                          var store = grid.getStore();
                          var rec = store.getAt(rowIndex);
                          if (rec.get("id")> 0 ) {
                              Ext.Msg.confirm("Confirmation", "Do you want to delete?", function(btnText){
                                  if(btnText === "no"){
                                  }
                                  else if(btnText === "yes"){
                                      rec.set("_destroy",true);
                                      grid.grid.getView().refresh();
                                  }
                              }, this);


                          }else{
                              store.remove(rec);
                          };
                      }
                  }]
              }

            ],

        });
        this.callParent(arguments);
    },




});
