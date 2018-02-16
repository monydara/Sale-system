Ext.define('App.view.item.item.GridVariance', {
    extend:'Ext.panel.Panel',
    alias:'widget.gridItemVariance' ,
    initComponent:function () {
        Ext.apply(this, {
            items:[
              this.getItemOption()
            ]
        });
        this.callParent(arguments);
    },
    getItemOption:function() {
      var shows = Ext.create('Ext.data.Store', {
        fields: ['id','name'],
         data: [
           {id: 0, name: 'Battlestar Galactica'},
           {id: 1, name: 'Doctor Who'},
           {id: 2, name: 'Farscape'},
           {id: 3, name: 'Firefly'},
           {id: 4, name: 'Star Trek'},
           {id: 5, name: 'Star Wars: Christmas Special'}
          ] });

        return Ext.create('Ext.form.Panel', {
           title: 'Sci-Fi Television',
           height: 200, width: 500,
            items: [
              {
                xtype: 'tagfield', fieldLabel: 'Select a Show',
                name:'option_value',
            store: shows,
            displayField: 'name',
             valueField: 'name',
              queryMode: 'local',
               filterPickList: true }]
             });


    }
  });
