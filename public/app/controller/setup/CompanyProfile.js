Ext.define('App.controller.setup.CompanyProfile', {
	extend: 'Ext.app.Controller',
	views: [
		'setup.companyProfile.Index',

	],
	stores: [
		'setup.CompanyProfile',

	],
	init: function() {

		this.control({
			'companyProfileIndex button[action=Save]': {
				click: this.save
			},
			'companyProfileIndex filefield': {
				change: this.uploadImage
			},
			'companyProfileIndex button[action=Remove]': {
				click: this.removeImage
			},



		});
	},
	removeImage:function(btn){
		var form = btn.up('form');
		Ext.MessageBox.confirm('Confirm', 'Are you sure to remove this iamge?', function(btn){
				 if(btn=='yes'){
				 	Util.ajax("CompanyProfile/remove_image");
				 	form.down('image').setSrc('');
				 	Ext.MessageBox.show({
						title: 'Saved',
						msg: 'Record Save Succeed.',
						icon: Ext.MessageBox.INFO,
						buttons: Ext.Msg.OK
					});
				 }
			});
	},
	uploadImage: function(field) {
		var form = field.up('form');
		if (form.getForm().isValid()) {
			form.getForm().submit({
				url: 'CompanyProfile/update',
				waitMsg: 'Uploading your image...',
				success: function(formPanel, action) {
					var data = Ext.decode(action.response.responseText);
					form.down("image").setSrc(data.data.image_file_name);
				},
				failure: function(formPanel, action) {
					var data = Ext.decode(action.response.responseText);
					alert("Failure: " + data.data);
				}
			});

		}

	},

	save: function(btn) {

		var form = btn.up('form').getForm(),
			frm = btn.up('form'),
			me = this,
			values = form.getValues(),
			record = form.getRecord(),
			store = me.getSetupCompanyProfileStore();

		if (form.isValid()) {


			var model = Ext.create('App.model.CompanyProfile');
			model.set(values);
			store.add(model);

			store.sync({
				success: function(batch, options) {
					
					Ext.MessageBox.show({
						title: 'Saved',
						msg: 'Record Save Succeed.',
						icon: Ext.MessageBox.INFO,
						buttons: Ext.Msg.OK
					});

				},
				failure: function(batch, options) {
				
					var msg = batch.proxy.reader.rawData.error;
					Ext.MessageBox.show({
						title: 'Error',
						msg: msg,
						icon: Ext.MessageBox.ERROR,
						buttons: Ext.Msg.OK
					});
				},
			});


		} else {
			Util.msg('Please entry require field');
		}


	},



})