Ext.define('App.store.report.ReportCustomer', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.Contact',
    controllerLoad:false,
    proxy:App.conf.Store.proxy('/report_customers')
});
