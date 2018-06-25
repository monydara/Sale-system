Ext.define('App.store.report.ReportCustomerBalanceDetail', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.Contact',
    controllerLoad:false,
    proxy:App.conf.Store.proxy('/report_customer_balance_detail')
});
