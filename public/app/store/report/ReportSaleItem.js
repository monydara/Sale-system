Ext.define('App.store.report.ReportSaleItem', {
    extend: 'Ext.data.Store',
    queryMode: 'local',
    autoLoad:false,
    model: 'App.model.Contact',
    controllerLoad:false,
    proxy:App.conf.Store.proxy('/report_sale_items')
});
