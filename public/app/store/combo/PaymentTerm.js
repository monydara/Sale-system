Ext.define('App.store.combo.PaymentTerm', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.PaymentTerm',
    proxy:App.conf.Store.proxy('/PaymentTerms/combo')

});
