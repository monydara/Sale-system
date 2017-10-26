
Ext.define('App.controller.admin.User', {
	extend: 'Ext.app.Controller',
	views:[
		'admin.user.Index',
		'admin.user.Form'

	],
	stores:[
		'admin.User',
		'combo.Department',
		'combo.Role'
	],
	init: function() {

	    this.control({
	    	'userIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'userForm button[action=Save]':{
	    		click: this.save
	    	},
	    	'userForm button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	'userForm textfield[name=password]':{
	    		blur: this.setPassword
	    	}
	    });
	},
	setPassword:function(field){
		var value = field.getValue();
		var newPsw = hexMD5(value);
		field.setValue(newPsw);

	},
	add:function(btn){
		var conatiner = btn.up('userIndex');
		var form = conatiner.down('userForm');
		form.getForm().reset();
		conatiner.setActiveItem(form);

	},
	edit: function(rec,grid){

		var conatiner = grid.up('userIndex');
		var form = conatiner.down('userForm');
		form.getForm().reset();
		form.loadRecord(rec);
		conatiner.setActiveItem(form);

	},
	save :function(btn){
		var store = this.getAdminUserStore();
		var me = this ;
		Util.saveForm(btn,store,'admin.User', me);


	},
	cancel:function(btn){
		var conatiner = btn.up('userIndex');
		var grid = conatiner.down('grid[name=index]');
		conatiner.setActiveItem(grid);
	},
	delete: function(rec , grid ){
		var store = grid.getStore();
		 Ext.MessageBox.confirm('Confirm', 'Are you sure to Delete this record?',
		 	function(btn ){

		 		if (btn == 'yes') {
		 			store.remove(rec);
		 			store.sync();
		 		};
		 	});

	},

	getMenuList:function(view){
		Util.ajax("/Menu" ,{menu:0}, this.applyMenuList , view)
	},
	applyMenuList:function(obj , view){
		main_menu = obj.main
		sub_menu = obj.sub
		items = new Array()
		me = App.app.getController('admin.User')

		main_menu.forEach(function(eachMainMenu){

			main_id = eachMainMenu.id
			subItemMenu = new Array()
// =========== sub menu
			sub_menu.forEach(function(eachSubMenu){
				if (eachSubMenu.parent_id == main_id ) {
					subObj={
						text: eachSubMenu.menu,
	            		style:'font-weight:bold',
	            		iconCls:eachSubMenu.icon_cls,
	            		handler:me.fn,
	            		cn:eachSubMenu.controller_name,
		                vn:eachSubMenu.view_index

					}
					subItemMenu.push(subObj)
				};

			})

// ========== main menu
			if (subItemMenu.length>0){
				itemObj={
					title:"<i class='"+eachMainMenu.icon_cls +"' style=\"" +
                    "    color: #157fcc !important;" +
                    "\"> </i>  "+eachMainMenu.menu,
	   				xtype:'menu',
	   				cls:'my-menu',
	   				//iconCls:eachMainMenu.icon_cls ,
	   				items:subItemMenu
				}
				items.push(itemObj)

			}


		})
		// debugger;
		view.add(items)

	},
	fn:function(field){
  		var controllerName = field.cn ;
  		var viewName = field.vn ;
  		if (controllerName) {
  			// check if form already load
  			App.app.getController('Menu').loadStore( controllerName, viewName+".Index");
  		}

  		if (viewName) {
  			App.app.getController('Menu').showPage(viewName+".Index");

  		};


  	},




})
