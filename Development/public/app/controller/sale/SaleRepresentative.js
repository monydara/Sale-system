Ext.define('App.controller.sale.SaleRepresentative', {
	extend: 'Ext.app.Controller',
	views: [
		'sale.saleRepresentative.Index',
		'sale.saleRepresentative.Frm',

	],
	stores: [
		'sale.SaleRepresentative',
		'combo.Position'
	],
	init: function() {

		this.control({
			'saleRepresentativeIndex button[action=Add]': {
				click: this.add
			},
			'saleRepresentativeIndex button[action=Edit]': {
				click: this.edit
			},
			'saleRepresentativeIndex textfield[name=Search]': {
				change: this.search
			},

			'saleRepresentativeForm button[action=Save]': {
				click: this.save
			},
			'saleRepresentativeForm button[action=Cancel]': {
				click: this.cancel
			},
		


		});
	},
	
	search: function(field) {
		var store = this.getSaleSaleRepresentativeStore();
		var params = {
			search_string: field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},


	add: function(btn) {
		var conatiner = btn.up('saleRepresentativeIndex');
		var form = conatiner.down('saleRepresentativeForm'),
			me = this;
		form.getForm().reset(true);
		conatiner.setActiveItem(form);

		
	},
	

	edit: function(btn) {

		var conatiner = btn.up('saleRepresentativeIndex');
		var form = conatiner.down('saleRepresentativeForm');
		var record = Util.getRecord(btn);

		form.getForm().reset(true);
		form.loadRecord(record);
		conatiner.setActiveItem(form);

		
	},

	save: function(btn) {

		var form = btn.up('form').getForm(),
			frm = btn.up('form'),
			me = this,
			values = form.getValues(),
			record = form.getRecord(),
			store = me.getSaleSaleRepresentativeStore();

		if (form.isValid()) {

			if (record) {
		
				record.set(values);
			} else {
				var model = Ext.create('App.model.SaleRepresentative');
				model.set(values);
				store.add(model);
			};

			store.sync();
			me.cancel(btn);
			store.load();
			App.app.getStore("combo.SaleRepresentative").load() ;

		} else {

			Util.msg('Please entry require field');
		}


	},
	cancel: function(btn) {
		var conatiner = btn.up('saleRepresentativeIndex');
		var grid = conatiner.down('grid[name=index]');
		conatiner.setActiveItem(grid);
	}



})