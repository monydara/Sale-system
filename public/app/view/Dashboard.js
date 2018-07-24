Ext.define('App.view.Dashboard', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.fmDashboard',
    border: true,
    region: 'center',
    layout: 'card',
    id: 'container-page',
    title:'Dashboard Header',
    items:[
        {
            xtype:'panel',
            width:500 , 
            height: 200 , 
            tpl:new Ext.Template(
                '<div name="{id}"> this div',
                    '<span class="{cls}">{name:trim} {value:ellipsis(10)}</span>',
                    '<h1> this is template "{name}"</h1>' ,
                '</div>',
                // {
                //     compiled: true,      // compile immediately
                // }
            ),
        }
    ]
   
   


});