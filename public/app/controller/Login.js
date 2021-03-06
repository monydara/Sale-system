
Ext.define('App.controller.Login', {
	extend: 'Ext.app.Controller',
	views:[
		'Login',
		'Header',
		'Menu',
		'Dashboard'
		
	],
	requires:[
	// config for store in system
		'App.conf.Store',
		// load config feature  like currency and other
		'App.store.Config'
	],
	init: function() {

	    this.control({
	    	"fmLogin":{
	    		afterrender:this.checkUserLogedIn
	    	},
	    	'fmLogin button[action=Login]':{
	    		click: this.clickLogin
	    	},
	    	'fmLogin textfield':{
	    		specialkey: this.submit
	    	},
	    	'fmHeader button[action=logout]':{
	    		click: this.logout
	    	}
	    });


	    
	},
    loadConfigure: function(){
        var me = this ;

        Util.ajax("Menu/load_config" , {} , App.store.Config.initParam)
    },

    logout:function(btn){
		this.showPageLogin();		

	},
	checkUserLogedIn:function(){
		var username = Ext.util.Cookies.get("username");
		var password = Ext.util.Cookies.get("password");

		// if (username && password) {
        //
		// 	this.logInProcess(username,password);
        //
		// }else{
        //
		// 	this.showPageLogin();
        //
		// };
	},
	showPageLogin:function(){
		// var form = Ext.create("Ext.form.Panel");
        //
		// form.getForm().doAction('standardsubmit',{
		//    url: '/home/logout',
		//    standardSubmit: true,
		//    method: 'POST'
		// });
        var page = Ext.getCmp('mainPage');
        //App.app.getController('admin.User').getMenuList(page.down('fmMenu'));
        page.getLayout().setActiveItem(0);
        page.down('textfield[name=username]').focus(true , 500);

	},
	submit:function(f,e){
		if (e.getKey() == e.ENTER) {
                    this.clickLogin();
        }
	},
	showPageCustomer:function(){
		var page = Ext.getCmp('mainPage');
        App.app.getController('admin.User').getMenuList(page.down('fmMenu'));
		page.getLayout().setActiveItem(1);
	},
	logInProcess:function(username, password){

		if(username && password){
			 Ext.MessageBox.wait("Please Wait ...... ",'logIn');
			
			this.username=username;
			this.password=password;
			// this.showPageCustomer();
			Util.ajax('Login/login',{username:username,password:password},this.resultLogin,this);	
		}


	},
	resultLogin: function(obj,me){
		
		if (obj.success) {
			me.setToken(obj)
			// Ext.get('loggedin').setText(obj.data.first_name +" "+ obj.data.last_name);
			me.showPageCustomer();
			Ext.MessageBox.hide();

            me.loadConfigure();
			
		}else{
			Ext.MessageBox.hide();
			Ext.Msg.alert('Inform', 'Incorrect Username or Password');
			me.showPageLogin();			

		};
	},
	setToken:function(obj ){
        App.conf.Store.token = obj.token;
	},
	clickLogin:function(){
		var form =Ext.getCmp('mainPage').down('form');

		if (form.getForm().isValid()) {
			var values = form.getValues();
			this.logInProcess(values.username, hexMD5(values.password));

		}else{
			Ext.Msg.alert('Inform', 'Please entry Username and Password');
		};

	}	

})