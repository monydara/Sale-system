Ext.define('App.store.setup.PaymentTerm', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.PaymentTerm',
    proxy:App.conf.Store.proxy('/payment_terms')

});
