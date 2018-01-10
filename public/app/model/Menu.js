Ext.define('App.model.Menu', {
    extend: 'Ext.data.Model',
    fields: [
      'id',
      'menu',
      'icon_cls',
      'expand',
      'is_leaf',
      'parent_id',
      'action',
      'is_active',
      'view_index',
      'controller',
      'controller_name',
        'seq_no'

    ]

});
