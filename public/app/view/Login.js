
Ext.define('App.view.Login', {
    extend:'Ext.panel.Panel',
    alias:'widget.fmLogin' ,
    // make panel center
  	layout: {
		type: 'vbox',
		align: 'center',
		pack: 'center'
	}  ,
    bodyStyle:'background-image: url(images/original/background.jpeg)',

    items:[
	    // {
	    // 	html:'<img src="images/companylogo.jpg" width = "200px" height="100px"> ' ,
	    // 	style:'margin-top:-200px'

	    // },
    	{
    		xtype:'form',
    		bodyPadding: 30 ,
    		// bodyStyle: 'background:transparent;',
    		title:' <center><font style="font-size:17px; font-weight:bold; " >Login Admin Page  </font></center>',
            style:'border: 1px solid silver',
    		border:true,
    		defaults:{allowBlank:false, width:350 },
    		items:[
          {
            xtype:'image',
            width:100 ,
            height: 80,
            style:'border:1px solid #157fcc;margin-left:125px;margin-top:-20px',
            src:'/system/company_profiles/images/000/000/001/original/Screen_Shot_2017-09-16_at_9.59.07_PM.png?1505573974'
          },
    			{
    				xtype:'textfield',
    				name:'username',
                    emptyText:'User Name',
    				fieldLabel:'User Name',
                    //value:'dara5'
    			},{
    				xtype:'textfield',
    				inputType: 'password' ,
                    emptyText:'Password',
    				fieldLabel:'Password',
                    //value:'dara',
    				name:'password'
    			}


    		],
    		buttons:[
    			{
    				text:'Login',
    				action:'Login',
                    iconCls:'fa fa-sign-in'
    			}

    		]
    	}

    ]


});
