Ext.define('App.controller.item.Item', {
	extend: 'Ext.app.Controller',
	views: [
		'item.item.Index',
		'item.item.FmItem',
	],
	stores: [
		'item.Item',
		'combo.UM',
		'combo.ItemCategory',
		'combo.ItemType',
		"item.ItemPrice"
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
	    	}

		});
	},
	addRow: function(btn) {

		var store = btn.up('grid').getStore();
		var model = Ext.create("App.model.ItemPrice");
		model.set("item_id", null);
		store.add(model);

	},
	reloadStoreCategory: function() {
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
				failure: function(formPanel, action) {
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

				// Ext.MessageBox.show({
				// 	title: 'Saved',
				// 	msg: 'Record Save Succeed.',
				// 	icon: Ext.MessageBox.INFO,
				// 	buttons: Ext.Msg.OK
				// });
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
		form.down('image').setSrc('')
		me.getItemItemPriceStore().removeAll();
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
			}
			else {
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
			};
		} else {
			Ext.Msg.alert("Error", "System Can't Get Code");
		};
	},

	edit: function(btn) {
		var conatiner = btn.up('itemIndex');
		var form = conatiner.down('FormItem');
		var record = Util.getRecord(btn);
		var me = this;
		if (record) {
			form.getForm().reset(true);
			form.loadRecord(record);
			form.down('image').setSrc(record.get('image_url'))
			conatiner.setActiveItem(form);
			me.getItemItemPriceStore().load({
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
			Util.msg("Item cannot edit!")
		};
	},

	save: function(btn) {

		var form = btn.up('form').getForm(),
			frm = btn.up('form'),
			me = this,
			values = form.getValues(),
			record = form.getRecord(),
			store = me.getItemItemStore();

		if (form.isValid()) {

			if (record) {
				values["item_price_attributes"] = Util.getItemStore(me.getItemItemPriceStore());
				record.set(values);
			} else {
				var model = Ext.create('App.model.Item');
				values["item_price_attributes"] = Util.getItemStore(me.getItemItemPriceStore());
				model.set(values);
				store.add(model);
			};

			var recs = store.getModifiedRecords();
			if (recs.length > 0) {

				Ext.MessageBox.wait("Please System Proccessing Data.....", "Please Wait")
			};

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
	cancel: function(btn) {
		var conatiner = btn.up('itemIndex');
		var grid = conatiner.down('grid[name=index]');
		conatiner.setActiveItem(grid);
	}
})
