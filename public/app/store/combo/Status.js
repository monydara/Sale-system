Ext.define('App.store.combo.Status', {
    extend: 'Ext.data.Store',
    controllerLoad:false,
    autoLoad:false,
    fields:['id', 'name'],
    data : [
            { id : true , name :'Active'},
            {id :false , name :'Deactive'}
          ]
});
