
// --- grid pagination . it will to add store attribute
Ext.define('App.view.custom.Pagination',{
    extend:'Ext.toolbar.Paging',
    alias:'widget.cPaging',
    displayInfo: true,
    displayMsg: 'view {0} - {1} of {2}',
    emptyMsg: "view 0"
})