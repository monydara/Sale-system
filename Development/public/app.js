var redStar = "<span style='color:red'> * </span>";
Ext.application({
    appFolder:'app',
    name:'App',
    controllers:[

    	'Login',
        'Util',
        'Menu',
        
        // sale menu
        // 'sale.Customer',
        // 'sale.Quotation',
        // 'sale.Invoice',
        // 'sale.SaleRepresentative',
        // "sale.CustomerPayment",
        // "sale.Contact",

        // // set up menu
        // 'setup.Area',
        // 'setup.PaymentTerm',
        // 'setup.Code',
        // 'setup.CompanyProfile',
        // 'setup.Position',

        // // 'fixAsset.Transfer',
        // 'fixAsset.Depreciation',
        // 'item.Item',
        // 'item.ItemCategory',
        // 'item.UM',
        // 'item.Location',
        // 'item.AdjustStock',
        // 'item.OpeningStock',

        // maintenance menu
        // 'service.Maintenance',
        // 'service.TerminateMaintenance',
    ],
    launch : function() {
      var viewport = Ext.create('App.view.Viewport');
    }
});
