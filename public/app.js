var redStar = "<span style='color:red'> * </span>";
Ext.application({
    appFolder:'app',
    name:'App',

    controllers:[
    	'Login',
        'Util',
    ],
    launch : function() {
    ///--- ajax load company logo
    Util.ajax('/CompanyProfile');
      var viewport = Ext.create('App.view.Viewport');
    }
});
