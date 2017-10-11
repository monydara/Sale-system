var redStar = "<span style='color:red'> * </span>";
Ext.application({
    appFolder:'app',
    name:'App',

    controllers:[

    	'Login',
        'Util',

    ],
    launch : function() {
      var viewport = Ext.create('App.view.Viewport');
    }
});
