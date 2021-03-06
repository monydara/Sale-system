Ext.define('App.view.sale.customerPayment.PaymentFieldSet', {
    extend:'App.view.custom.FieldSet',
    alias:'widget.customerPaymentPaymentFieldSet',
    title:'<b> Payment </b>',
    initComponent:function () {

        var me = this;
        Ext.apply(me,{
            items:me.getFieldCurrency(),


            });
        this.callParent(arguments);

    },

    getFieldCurrency:function () {
        var me = this ;
        var items =[]
        App.store.Config.allCurrency.forEach(function(currency){
            items.push({
                xtype:'numberfield',
                minValue: 0 ,
                default:0,
                name:'currency_'+currency.id,
                fieldLabel:currency.name+"( "+currency.symbol+" )"
            })
        })
        items = me.getDisplaySummaryAmount(items);
        items.push(me.getButtonApply())
        return items;
    },

    getDisplaySummaryAmount:function (items) {
        App.store.Config.allCurrency.forEach(function(currency){
            items.push({
                xtype:'displayfield',
                value: 0 ,
                name:'currency_'+currency.id,
                fieldLabel:"Total( "+currency.symbol+" ): ",
                renderer:function (value) {
                   return App.conf.GlobalFn.currencyFormat(value , currency.id );
                }
            })
        })

        return items;

    },
    getButtonApply:function () {
        return {
            xtype:'button',
            text:'Apply',
            action:'Apply',
            width:100,
            style:'margin-left:100px'
        }
    }
})