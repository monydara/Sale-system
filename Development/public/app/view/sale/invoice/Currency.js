Ext.define('App.view.sale.invoice.Currency', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.invTotalByCurrency',

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
             items.push( me.getFieldSet(cur.id , "Total( "+cur.abbr+" )" , cur.fraction_unit, cur.rate_in , cur.rate_out))

         }
         return items;
    },
    getFieldSet:function (formName ,title, fraction_unit , rate_in , rate_out ) {
        var panel = {
            xtype:'fieldset' ,
            title: title ,
            name:formName ,
            items:[
                {
                    xtype:'numberfield' ,
                    name: 'discount_'+formName ,
                    fieldLabel:'Discount'
                }, {
                    xtype:'numberfield' ,
                    name:'tax_amount'+formName,
                    fieldLabel:'TaxAmount'
                },{
                    xtype:'textfield',
                    readOnly:true ,
                    name:'grand_total_'+formName ,
                    fieldLabel: 'Total Amount'
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