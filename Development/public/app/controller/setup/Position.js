Ext.define('App.controller.setup.Position', {
	extend: 'Ext.app.Controller',
	views: [
		'setup.position.Index',
		'setup.position.Frm',

	],
	stores: [
		'setup.Position',

	],
	init: function() {

		this.control({
			'positionIndex button[action=Add]': {
				click: this.add
			},
			'positionIndex button[action=Edit]': {
				click: this.edit
			},
			'positionIndex button[action=Delete]': {
				click: this.delete
			},


			'frmPosition button[action=Save]': {
				click: this.save
			},
			'frmPosition button[action=Cancel]': {
				click: this.cancel
			},


		});
	},

	delete: function(btn) {


		var record = Util.getRecord(btn),
			me = this;
		if (record) {

			Ext.MessageBox.confirm('Confirm', 'Are you sure to delete this position?', function(btn) {
				if (btn == 'yes') {
					var store = me.getSetupPositionStore();
					store.remove(record);
					store.sync();
					Ext.MessageBox.show({
						title: 'Saved',
						msg: 'Position Delete Success.',
						icon: Ext.MessageBox.INFO,
						buttons: Ext.Msg.OK
					});
				}
			});


		} else {
			Util.msg("Please Select Quotation For Submit");
		};
	},

	add: function(btn) {
		var win = Ext.create('App.view.setup.position.Frm');
		win.show();
		win.center();
		win.down('textfield[name=name]').focus(true, 300);

	},
	edit: function(btn) {


		var record = Util.getRecord(btn);

		if (record) {
			var win = Ext.create('App.view.setup.position.Frm');
			win.show();
			win.center();
			win.down('form').getForm().loadRecord(record);
			win.down('textfield[name=position]').focus(true, 300);

		};

	},

	save: function(btn) {

		var form = btn.up('window').down('form').getForm(),
			frm = btn.up('window').down('form'),
			me = this,
			values = form.getValues(),
			record = form.getRecord(),
			store = me.getSetupPositionStore();

		if (form.isValid()) {

			if (record) {
				record.set(values);
			} else {
				var model = Ext.create('App.model.Position');
				model.set(values);
				store.add(model);
			};
			store.sync();
			me.cancel(btn);

		} else {
			Util.msg('Please entry require field');
		}


	},
	cancel: function(btn) {
		var win = btn.up('window');
		win.close();
	}



})