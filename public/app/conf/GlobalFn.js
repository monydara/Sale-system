Ext.define('App.conf.GlobalFn',{
    singleton: true,
    requires:[
        'App.view.template.cmbCustomer',
        'App.view.template.cmbCustomerType',
        'App.view.template.cmbCustomPrice',
        'App.view.template.cmbCustomerArea',
        'App.view.template.cmbCustomerArea',
        'App.view.template.txtDate',
        'App.view.template.cmbCurrency',
        'App.view.template.cmbItem',
        'App.view.template.cmbInvoice',
        'App.view.custom.FieldSet'


    ],
    // get currency format base on currency id
    currencyFormat:function (amount , currencyId ) {
        var amountFormat ="";
        App.store.Config.allCurrency.forEach(function(currency){
            if(currency.id == currencyId){
                amountFormat = currency.symbol + Ext.util.Format.currency(amount ," " , 2,false);
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
    exchangeCurrency:function(amount,currencyId , toCurrencyId){
        var config = App.store.Config.allCurrency ;
        var localAmount = this.exchagneLocalRateIn(amount , currencyId );
        var convertedAmount = 0 ;
         for(var index in config ){
             if(config[index].id == toCurrencyId){
                convertedAmount =  localAmount * config[index].fraction_unit / config[index].rate_in;
                break;
             }
         }

        return convertedAmount;
    },
    //-- set auto set grid to edit
    startGridEdit:function(grid , rowIndex , colInex){
        var editor = grid.plugins[0] ;
       var e=  editor.startEdit(rowIndex, colInex);
        //debugger;

    },
    getCurrencyObj:function(currencyId){
        var curs = App.store.Config.allCurrency ;
        for (var i in curs) {
          if (curs[i].id == currencyId) {
            return curs[i];
            
          }
        }
    }


});
