Ext.define('App.conf.GlobalFn',{
    singleton: true,
    requires:[
        'App.view.template.cmbCustomer',
        'App.view.template.cmbCustomerType',
        'App.view.template.cmbCustomPrice',
        'App.view.template.cmbCustomerArea',
    ],
    // get currency format base on currency id
    currencyFormat:function (amount , currencyId ) {
        var amountFormat ="";
        App.store.Config.allCurrency.forEach(function(currency){
            if(currency.id == currencyId){
                amountFormat = Ext.util.Format.currency(amount , currency.symbol , 2,false);
                return 0;
            }
        });
        return amountFormat ;

    },

    // --  change other currency to local currency
    exchagneLocalRateIn:function( amountConvert , currencyId ){
        var config = App.store.Config ;
        var amount = 0 ;
        for(var index in config.allCurrency ){
            var cur = config.allCurrency[index];

            if(cur.id == currencyId){

               if(cur.is_base == true ) {
                   amount = amountConvert;
               }else{

               }
                    amount =  amountConvert * cur.rate_in / cur.fraction_unit;
                break ;
            }

        }

        return amount ;

    },
    //-- set auto set grid to edit
    startGridEdit:function(grid , rowIndex , colInex){
        var editor = grid.plugins[0] ;
       var e=  editor.startEdit(rowIndex, colInex);
        //debugger;

    }


});
