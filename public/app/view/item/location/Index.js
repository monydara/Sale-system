
Ext.define('App.view.item.location.Index', {
    extend:'Ext.panel.Panel',
    alias:'widget.locationIndex' ,	   
   
    border:true,
    layout:'card',   
    initComponent:function () {
        Ext.apply(this, {   
            items:[

            { 
                title:'<font style="font-size: 18px;font-weight: bold;color: darkgoldenrod;text-decoration: underline;" > Location List</font>',
                 tools:[
                    {
                       xtype:'cTxtSearch'
                    },
                    {
                      xtype:'cBtnAdd'
                    },{
                       xtype:'cBtnEdit'
                    }
                ],
                xtype:'grid',
                border:true,
                name:'index',
                store:'item.Location',                
                columns:[
                    {header:'NO', xtype:'rownumberer', width:50, align:'center'},

                    {header:'Name', flex:1, dataIndex:'name'},
                    {header:'Phone', flex:1, dataIndex:'phone'},
                    {header:'Email', flex:1, dataIndex:'email'},
                    {header:'Address', flex:1, dataIndex:'address'},
                    {header: 'Remark', flex:1, dataIndex: 'remark'},
                ],
                bbar:{
                    xtype:'cPaging' ,
                    store:'item.Location'
                }

            }
            ,{
                xtype:'FormLocation'
            }
        ]
        });
        this.callParent(arguments);
    },

});