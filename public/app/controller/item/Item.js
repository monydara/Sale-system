Ext.define('App.controller.item.Item', {
	extend: 'Ext.app.Controller',
	views: [
		'item.item.FMVariance',
		'item.item.Index',
		'item.item.FmItem',
		'item.item.GridVaraince',

	],
	requires:[
		'App.view.template.cmbBrand'
	],
	stores: [
		'item.Item',
		'combo.UM',
		'combo.ItemCategory',
		'combo.ItemType',
		'combo.Currency',
		'item.ItemPrice',
		'combo.Brand',
		'item.ItemSKU'
	],
	init: function() {

		this.control({
			'itemIndex button[action=Add]': {
				click: this.add
			},
			'itemIndex button[action=Edit]': {
				click: this.edit
			},
			'itemIndex textfield[name=Search]': {
				change: this.search
			},

			'FormItem button[action=Save]': {
				click: this.save
			},
			'FormItem button[action=Cancel]': {
				click: this.cancel
			},

			'FormItem button[action=Remove]': {
				click: this.removeImage
			},
			'FormItem filefield': {
				change: this.uploadImage
			},

			'FormItem button[action=AddCategory]': {
				click: this.AddCateogry
			},
			'FormItemCategory button[action=Save]': {
				click: this.reloadStoreCategory
			},
			'FormItem button[action=AddUM]': {
				click: this.AddUM
			},
			'FormUM button[action=Save]':{
	    		click: this.reloadStoreUM
	    	},
	    	"FormItem button[action=addItemPrice]":{
	    		click : this.addRow
	    	},
				//=== form generate item variance
				"fmItemVariance button[action=AddItemVariance]":{
					click : this.addVarainceProduct
				},
				"fmItemVariance button[action=GenerateItem]":{
					click : this.generateItemVarianceV1
				},
				"fmItemVariance button[action=removeOption]":{
					click : this.removeItemOption
				},



		});
	},
	removeItemOption:function(btn){
		var index= btn.name.split('|')[1];
		var fm = btn.up('fmItemVariance');
		debugger;
		var txtOpt =fm.down('textfield[name=option_name|'+index +']');
		var cmbOpt =fm.down('tagfield[name=value|'+index+']');
		fm.remove(txtOpt,true);
		fm.remove(cmbOpt,true);
		fm.remove(btn,true);
		//TODO
		
	},
	generateItemVarianceV1:function(btn){
		//-- get item
		var f = btn.up('fmItemVariance');
		var grid = f.up('form').down("gridVaraince");
		var itemName = f.up('form').getValues().name ;
		var values = f.getValues();
		var legnth = f.items.length;
		var items = {"total" : 1 , "length" : legnth-1  , "active" : legnth-1  , "items" : {}};
		//-- count item and index
		for (var i = 1; i <= legnth-1; i++) {
			var n = values['option_name|'+i] ;
			var v = values['value|'+i];
			var subItem = {}
			subItem["total"] =v.length;
			subItem["count"] = 0 ;
			subItem["item"] = v ;
			var item = items.items ;
			item[i] =  subItem;
			items.total = items.total * v.length;

		}

		loopItem(items , itemName , 1 , grid );


		function loopItem(items , itemName , indexItem ,grid ){
			 var item = items.items[indexItem].item ;
			 var originalItemName = itemName ;

				for (var i  in item) {

						itemName =originalItemName;
						itemName += "/"+ item[i];

					if(items.length == indexItem){
						addItemToGrid(itemName , grid)

					}else{
						// --- loop child
						loopItem(items , itemName , (indexItem+1) , grid);
					}


				}

		}

		function addItemToGrid(itemName , grid ){
				var model = Ext.create('App.model.ItemSKU');
				model.set('code' , itemName );
		    model.set('price',0);
		    model.set('cost',0);
		    model.set('is_delete',false);
				var store = grid.getStore();
				if(store.find('code' , itemName) == -1 ){ //-- add item if not exist
					store.add(model);
				}
		}
	},
	addVarainceProduct:function(btn ){
		// debugger;
		var f = btn.up('fmItemVariance');
		var item = f.getItemOption(f.items.length);
		f.add(item);

	},
	addRow: function(btn) {

		var store = btn.up('grid').getStore();
		var model = Ext.create("App.model.ItemPrice");
		model.set("item_id", null);
		store.add(model);

	},
	reloadStoreCategory: function(btn) {
    App.app.getController("item.ItemCategory").save(btn);
		var me = this ;
		setTimeout(function() {

			me.getComboItemCategoryStore().load();
		}, 1000);
	},
	AddCateogry: function(btn) {
		var win = Ext.create('App.view.item.itemcategory.FmItemCategory');
		win.show();
		win.center();
		win.down('textfield[name=name]').focus(true, 300);
	},
	reloadStoreUM: function(btn){
		var me = this;
		setTimeout(function(){
			me.getComboUMStore().load();
		}, 1000);
	},
	AddUM: function(btn) {
		var win = Ext.create('App.view.item.um.FmUM');
		win.show();
		win.center();
		win.down('textfield[name=code]').focus(true, 300);
	},

	uploadImage: function(field) {
		var form = field.up('form');
		if (form.getForm().isValid()) {
			form.getForm().submit({
				url: '/Items/upload_image',
				waitMsg: 'Uploading Image ...',
				success: function(formPanel, action) {
					var data = Ext.decode(action.response.responseText);
					form.down('image').setSrc(data.image_url.replace("/", ""));
					form.down('hiddenfield[name=image_url]').setValue(data.image_url.replace("/", ""));
				},
				failure: function(formPanel, action){
					var data = Ext.decode(action.response.responseText);
					alert("Failure: " + data.data);
				}

			});
		}
	},
	removeImage: function(btn) {
		var form = btn.up('form');
		Ext.MessageBox.confirm('Confirm', 'Are you sure to remove this iamge?', function(btn) {
			if (btn == 'yes') {
				// Util.ajax("Items/remove_image");
				form.down('image').setSrc('');
				form.down('hiddenfield[name=image_url]').setValue('');

			}
		});
	},


	search: function(field) {
		var store = this.getItemItemStore();
		var params = {
			search_string: field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},

	add: function(btn) {
		var conatiner = btn.up('itemIndex');
		var form = conatiner.down('FormItem');
		var me = this;
		form.getForm().reset(true);
		form.down('image').setSrc('');
		me.getItemItemPriceStore().removeAll();
		me.getItemItemSKUStore().removeAll();
		//-- reset form item varaince
		// var f = form.down('fmItemVariance');
		// debugger;
		// var item = f.getItemOption(f.items.length) ;
		// f.add(item);

		form.down('textfield[name=code]').focus(true, 300);
		conatiner.setActiveItem(form);

		//Function generate item code
		Util.ajax("/Code/get_code", {
			n_type: 'ITEM'
		}, me.setCode, form);
	},

	setCode: function(obj, form) {
		if (obj.success) {
			var txtCode = form.down("textfield[name=code]");
			// check form is do action for add new or edit
			if(form.getRecord()) {
				// for edit form
				if (obj.is_manaul) {
					txtCode.setReadOnly(false);
				} else {
					txtCode.setReadOnly(true);
				}
			}else {
				// for add new form
				if(obj.is_manaul) {
					txtCode.setReadOnly(false);
					txtCode.setValue('');
					txtCode.focus(true, 200);
				}
				else {
					txtCode.setValue(obj.code);
					txtCode.setReadOnly(true);
					form.down('textfield[name=name]').focus(true, 300);
				}
			}
		}else{
			Ext.Msg.alert("Error", "extjs Can't Get Code");
		}
	},

	edit: function(btn) {
		var conatiner = btn.up('itemIndex');
		var form = conatiner.down('FormItem');
		var record = Util.getRecord(btn);
		var me = this;
		if (record) {
			form.getForm().reset(true);
			form.loadRecord(record);
			form.down('image').setSrc(record.get('image_url'));
			conatiner.setActiveItem(form);
			//-- load item price
			me.getItemItemPriceStore().load({
				params:{
					item_id:record.get("id")
				}
			});

			//-- load item variance
			me.getItemItemSKUStore().load({
				params:{
					item_id:record.get("id")
				}
			});
			//Function generate item code
			Util.ajax("/Code/get_code", {
				n_type: 'ITEM'
			}, me.setCode, form);
		}
		else {
			Util.msg("Item cannot edit!");
		}
	},

	save: function(btn) {

		var form = btn.up('form').getForm(),
			frm = btn.up('form'),
			me = this,
			values = form.getValues(),
			record = form.getRecord(),
			store = me.getItemItemStore();

		if (form.isValid()) {
			values["item_price_attributes"] = Util.getItemStore(me.getItemItemPriceStore());
			var itemsku = me.getItemItemSKUStore() ;

			if (itemsku.count() > 0 ) {
			values["item_sku_attributes"] = Util.getItemStore(me.getItemItemSKUStore());
			//-- get item option
			var values = me.getItemOption(btn , values );
			console.log(items, '----');
			//-- get item value
			values["is_variance"] = true ;
			}

			if (record) {
				record.set(values);
			} else {
				var model = Ext.create('App.model.Item');
				model.set(values);
				store.add(model);
			}

			var recs = store.getModifiedRecords();
			if (recs.length > 0) {

				Ext.MessageBox.wait("Please extjs Proccessing Data.....", "Please Wait");
			}

			store.sync({
				success: function() {
					Ext.MessageBox.hide();
					me.cancel(btn);
					store.load();
				},
				failure: function(batch, option) {
					store.rejectChanges();
					Ext.MessageBox.hide();

					var msg = option.batch.proxy.reader.rawData.message;
					Ext.MessageBox.show({
						title: 'Error',
						msg: msg,
						icon: Ext.MessageBox.ERROR,
						buttons: Ext.Msg.OK
					});
				},
				scope:this
			});

		} else {
			Util.msg('Please entry require field');
		}


	},
	getItemOption:function(btn , value){

		var f = btn.up('form').down('fmItemVariance');
		var values = f.getValues();
		var legnth = f.items.length;
		value["item_options_attributes"] =[];
		//-- count item and index
		for (var i = 1; i <= legnth-1; i++) {
			var n = values['option_name|'+i] ;
			var v = values['value|'+i];
			var itemOptVal =[];
			for (var a = 0; a < v.length; a++) {
				itemOptVal.push({value_name:v[a]});
			}


			value["item_options_attributes"].push(
				{
					option_name: n,
					item_option_values_attributes: itemOptVal
				}
			);

		}
		return value;
	},
	cancel: function(btn) {
		var conatiner = btn.up('itemIndex');
		var grid = conatiner.down('grid[name=index]');
		conatiner.setActiveItem(grid);
	}
});
