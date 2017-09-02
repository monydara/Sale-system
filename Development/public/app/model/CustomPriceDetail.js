Ext.define('App.model.CustomPriceDetail', {
    extend: 'Ext.data.Model',
    fields: [
      'id',
      'custom_price_id',
      'item_id',
      'um_id',
      'price',
      'extend_price',
      'created_at',
      'updated_at',
      //=====
      'item_name' ,
      'um_name',
      "_destroy"
    ]

});
