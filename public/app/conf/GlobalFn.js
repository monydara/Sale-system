Ext.define('App.conf.GlobalFn',{
    singleton: true,
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
       var e=  editor.startEdit(rowIndex, colInex)
        //debugger;

    }


})