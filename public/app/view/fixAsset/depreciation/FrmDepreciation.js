Ext.define('App.view.fixAsset.depreciation.FrmDepreciation', {
    extend:'Ext.form.Panel',
    alias:'widget.FormDepreciation' ,	       
    bodyPadding:20 ,
    border:true,
    autoScroll:true,
    title:'Evaluation Fixed Asset',
    buttons:[
        '->',

        {
            xtype:'cBtnSave'
        },{
            xtype:'cBtnCancel'
        }
    ],
    defaultType:'textfield',
    items:[
        {
           xtype:'container',
           width:1200,
           items:[
           {

             name:'reference_no',
             width:400 , 
             fieldLabel:'Reference No',
             xtype:'textfield',
           },{
            name:'date',
            width:400,
            fieldLabel:'Date',
            xtype:'datefield',
           },{
            name:'serail_or_barcode',
            width:200 , 
            style:'margin-left:1000px',
            xtype:'textfield',
            emptyText:'Serail or Barcode',
           },{
             xtype:'grid',
                    // title:'Item Detail',
                    height: 300,
                    border:true,
                    style: 'border: solid 1px #cecece',
                    columns:[
                        
                            {header:'NO', xtype:'rownumberer', width:50, align:'center'}, 
                            {header:'Item ',width:200,dataIndex:'item_name', align:'center'},
                            {header:'Serail',width:100,dataIndex:'serail', align:'center'},
                            {header:'Purchase Date',width:150,dataIndex:'purchase_date',align:'center'},
                            {header:'Cost',width:100,dataIndex:'cost', align:'center'},
                            {header:'Asset Life(Year)',width:150,dataIndex:'aseet_life',align:'center'},
                            {header:'Aseet End Date',width:150,dataIndex:'asset_end_date', align:'center'},
                            {header:'Depr%',width:100,dataIndex:'depreciation', align:'center'},
                            {header:'Remark',flex:1,dataIndex:'remark', align:'center'},
                            {header:'Action',width:100,dataIndex:'action', align:'center'},

                    ]
           },{

            text:'Remark',
            xtype:'label',
            name:'label_remark', 
           },{
            name:'remark',
            width:400 , 
            xtype:'textarea',

           }

           ]
        }, 
    ]

});