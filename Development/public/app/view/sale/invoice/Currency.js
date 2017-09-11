Ext.define('App.view.sale.invoice.Currency', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.invTotalByCurrency',
    layout:'hbox',
    initComponent: function() {
        Ext.apply(this, {
           items:
               this.getForm()

        });
        this.callParent(arguments);
    },
    getForm:function () {;
        var me = this
         var curs= App.store.Config.allCurrency  ;
         var items =new Array();
         for(var index in curs){
             var cur = curs[index];
             console.log(cur)
             items.push( me.getFieldSet(cur.id , "Total( "+cur.abbr+" )" , cur.fraction_unit, cur.rate_in , cur.rate_out,cur.symbol))

         }
         return items;
    },
    getFieldSet:function (formName ,title, fraction_unit , rate_in , rate_out  , symbol) {
        var panel = {
            xtype:'fieldset' ,
            title: title ,
            defaults:{
              labelWidth: 120
            },
            name:formName ,
            items:[
                {
                    xtype:'numberfield',
                    name:'sub_total_'+formName,
                    fieldLabel:'Sub Total( '+symbol+' )',
                    readOnly:true
                },
                {
                    xtype:'numberfield' ,
                    hidden:true,
                    name: 'discount_amount_'+formName ,
                    fieldLabel:'Discount( '+symbol+' )',

                },
                {
                    xtype:'numberfield' ,
                    name:'tax_amount_'+formName,
                    fieldLabel:'TaxAmount( '+symbol+' )',
                    readOnly:true ,

                },{
                    xtype:'textfield',
                    readOnly:true ,
                    name:'grand_total_'+formName ,
                    fieldLabel: 'Total Amount( '+symbol+' )'
                },{
                    xtype:'hidden',
                    name:'rate_in'+formName ,
                    value : rate_in
                },{
                    xtype:'hidden',
                    name:'fraction_unit'+formName,
                    value : fraction_unit
                },{
                    xtype:'hidden',
                    name:'rate_out'+formName,
                    value : rate_out
                }



            ]
        }

        return panel ;

    }


});