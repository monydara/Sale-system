Ext.define('App.controller.sale.Quotation', {
	extend: 'Ext.app.Controller',
	views: [
		'sale.quotation.Index',
		'sale.quotation.Frm',
		'sale.quotation.FmQuotationItemDescription'

	],
	stores: [
		'sale.Quotation',
		'sale.QuotationDetail',

		'combo.Item',
		'combo.Customer',
		'combo.Lead',
		'combo.ItemPrice',
		'combo.SaleRepresentative',
		'combo.PaymentTerm'
	],
	init: function() {

		this.control({
			'quotationIndex button[action=Add]': {
				click: this.add
			},
			'quotationIndex button[action=Edit]': {
				click: this.edit
			},
			'quotationIndex textfield[name=Search]': {
				change: this.search
			},
			'quotationIndex button[action=Submit]': {
				click: this.submit
			},
			'quotationIndex button[action=Print]': {
				click: this.print
			},
			'quotationIndex button[action=To_excel]': {
				click: this.exportToExcel
			},
			'quotationIndex button[action=CancelQuotation]': {
				click: this.cancelQuotation
			},

			'quotationForm button[action=Save]': {
				click: this.save
			},
			'quotationForm button[action=Cancel]': {
				click: this.cancel
			},
			// grid  event
			'quotationForm button[action=AddItem]': {
				click: this.addRow
			},

			'quotationForm grid': {
				edit: this.setRecord,
				beforeedit: this.filterItemPrice
			},
			'quotationForm numberfield[name=tax_percentag]': {
				change: this.getTax
			},
			'quotationForm combo[name=customer_id]':{
				select : this.loadRecordCustomerToForm
			},
			'quotationForm combo[name=lead_id]':{
				select : this.loadContactLead
			},
			// 'quotationForm combo[name=payment_term_id]':{
			// 	select : this.selectPaymentTerm
			// },
			'quotationForm combo[name=quotation_to]':{
				change : this.selectQuotationTo
			},
			'frmDescription button[action=Save]': {
				click : this.save_description
			},
			'frmDescription button[action=Cancel]':{
				click : this.windowCancel
			},
			'quotationForm checkbox[name=is_vat]': {
				change: this.toggleVat
			},
			


		});
	},
	itemRecord: {},
	umRecord: {},
	selectQuotationTo:function(combo, value){
		var form = combo.up("form");
		var fieldCustomer = form.down("combo[name=customer_id]");
		var fieldLead = form.down("combo[name=lead_id]");

		if (value =="Lead") {
			fieldCustomer.allowBlank= true ;
			fieldCustomer.hide();
			fieldCustomer.setValue('');

			fieldLead.allowBlank=false ;
			fieldLead.show();
		}else{
		// customer
			fieldCustomer.allowBlank= false ;
			fieldCustomer.show();

			fieldLead.hide();
			fieldLead.allowBlank=true ;
			fieldLead.setValue("");
		};
	},

	toggleVat:function(field ,value){
		
		if (value) {
			field.up("form").down("numberfield[name=tax_percentag]").show();
			field.up("form").down('numberfield[name=tax_percentag]').focus(true, 300);
		}else{
			field.up("form").down("numberfield[name=tax_percentag]").hide();
			field.up("form").down('checkbox[name=is_vat]').focus(true, 300);
		};
	 },

	windowCancel:function(btn){
		var win = btn.up('window');
		win.close();
	},
	selectPaymentTerm:function(combo , recs){
		var rec = recs[0];
		combo.up("form").down("textarea[name=payment_term]").setValue(rec.data.payment_term_description);

	},
	loadContactLead:function(combo , records){
		var rec = records[0];
		var form = combo.up("form");
		form.down("textfield[name=contact_person_name]").setValue(rec.data.contact.contact_name);
		form.down("textfield[name=phone]").setValue(rec.data.contact.contact_mobile);
	},
	loadRecordCustomerToForm:function(field , records){
		var rec = records[0];
		var form = field.up('form');

		form.down("textfield[name=contact_person_name]").setValue(rec.data.contact.contact_name);
		form.down("textfield[name=phone]").setValue(rec.data.contact.contact_mobile);

	},
	storeDetailTmp: Ext.create('App.store.sale.QuotationDetail'),
	print:function(btn){
		var record = Util.getRecord(btn, "Please Select Quotation For Print");
		if (record) {
			window.open("/SaleQuotation/print_quotation.pdf?id="+record.get('id'));
		};
	},
	exportToExcel:function(btn){
		// var record = Util.getRecord(btn, "Please Select Quotation For Export");
		// if (record) {
		// 	window.open("/SaleQuotation/print_quotation.pdf?id="+record.get('id'));
		// };
		 Util.ajax("/WriteToExcel/index")
	},
	cancelQuotation: function(btn) {
		var conatiner = btn.up('quotationIndex');
		var form = conatiner.down('quotationForm');
		var record = Util.getRecord(btn),
			me = this;
		if (record) {
			if (record.get("status") == "D") {

				Ext.MessageBox.confirm('Confirm', 'Are you sure to Cancel this Quotation?', function(btn) {
					if (btn == 'yes') {
						record.set("status", "C");
						me.getSaleQuotationStore().sync();
						Ext.MessageBox.show({
							title: 'Saved',
							msg: 'Quotation Cancel Success.',
							icon: Ext.MessageBox.INFO,
							buttons: Ext.Msg.OK
						});
					}
				});
			} else {
				Util.msg("Quotation Can Cancel in Status Draft Only");
			};

		} else {
			Util.msg("Please Select Quotation For Submit");
		};

	},
	submit: function(btn) {
		var conatiner = btn.up('quotationIndex');
		var form = conatiner.down('quotationForm');
		var record = Util.getRecord(btn),
			me = this;
		if (record) {
			if (record.get("status") == "D") {
				Ext.MessageBox.confirm('Confirm', 'Are you sure to submit this Quotation?', function(btn) {
					if (btn == 'yes') {
						record.set("status", "S");
						me.getSaleQuotationStore().sync();
						Ext.MessageBox.show({
							title: 'Saved',
							msg: 'Quotation Submit Success.',
							icon: Ext.MessageBox.INFO,
							buttons: Ext.Msg.OK
						});
					}
				});
			} else {
				Util.msg("Quotation Can Submit In Status Draft only");
			}

		} else {
			Util.msg("Please Select Quotation For Submit");
		};

	},
	deleteDetailRecord: function(grid, rec) {
		var me = this;
		Ext.MessageBox.confirm('Confirm', 'Are you sure you want to remove this item ?', function(btn) {
			if (btn == 'yes') {
				var store = grid.getStore();

				if (rec.get('id') > 0) {
					rec.set("_destroy", true);

					me.storeDetailTmp.add(rec);

				}
				store.remove(rec);
				me.setTotalAmount(grid);

			}
		});

	},

	editDetailRecord: function(grid, rec) {
		var me = this;
			
				var store = grid.getStore();

				
					var win = Ext.create('App.view.sale.quotation.FmQuotationItemDescription');
					win.show();
					win.center();
					win.down('form').getForm().loadRecord(rec);
				
				

			
		

	},

	getTax: function(field) {
		var grid = field.up('form').down("grid");
		this.setTotalAmount(grid);
	},
	filterItemPrice: function(editor, e) {
		var grid = e.grid,
			me = this;
		var record = grid.getStore().getAt(e.rowIdx);

		switch (e.colIdx) {
			case 4:
				if (record.get("item_id") > 0) {
					me.getComboItemPriceStore().load({
						params: {
							item_id: record.get("item_id")
						}
					});

				};
				break;
		}


	},
	setRecord: function(editor, e) {

		var grid = e.grid,
			me = this;
		var record = grid.getStore().getAt(e.rowIdx);
		switch (e.colIdx) {

			case 1:
				getRecordComboSetToGrid(editor, e, me, record);
				break;
			case 2:
				getRecordComboSetToGrid(editor, e, me, record);
				break;
			case 3:
				getRecordComboSetToGrid(editor, e, me, record);
				break;
			case 4:
				setValuePrice(editor, e, me, record);
				break;
			case 5:
				setValueAmount(editor, e, me, record);
				break;
			case 6:
				setValueAmount(editor, e, me, record);
				break;
			default:

		}
		// ============== additional function
		function setValueAmount(editore, e, me, record) {
			record.set("extent_price", record.get("price") * record.get("qty"));
			me.setTotalAmount(e.grid);

		}

		function setValuePrice(editor, e, me, record) {
			var rec = me.umRecord;
			if (me.umRecord) {

				record.set("price", rec.get("price"));
				record.set("extent_price", rec.get("price") * record.get("qty"));
				record.set("um_id", rec.get("um_id"));
				record.set("um", rec.get("um"));
				me.setTotalAmount(e.grid);

				me.umRecord = false;
			};

		}

		function getRecordComboSetToGrid(editor, e, me, record) {

			if (me.itemRecord) {

				var values = me.itemRecord.data; //get record form grid/combobox

				// e.grid.getView().refresh();
				record.set("item_id", values.id);
				record.set("description", values.memo);
				record.set("qty", 1);
				record.set("um_id", values.um_id);
				record.set("total_qty", 1);
				record.set("price", values.price);
				record.set("extent_price", values.price);
				record.set("item_name", values.name);
				record.set("code", values.code);
				record.set("barcode", values.barcode);
				record.set("um", values.um);
				record.set("description", values.sale_description);


				me.setTotalAmount(e.grid);
				me.itemRecord = false;

			};

		}
	},

	setTotalAmount: function(grid) {

		//  sum total amount
		var totalAmount = 0;

		grid.getStore().each(function(rec) {
			totalAmount += rec.get("extent_price") * 1;
		});

		// calculate tax
		var form = grid.up("form");
		var taxRate = form.down("numberfield[name=tax_percentag]").getValue();
		var grandTotalAmount = totalAmount;
		if (taxRate > 0) {
			var taxAmount = (taxRate * totalAmount / 100);
			form.down("hiddenfield[name=tax_amount]").setValue(taxAmount);
			grandTotalAmount = totalAmount + taxAmount;
		};

		// grand total
		form.down("displayfield[name=total_amount_display]").setValue(totalAmount.toFixed(2));
		form.down("displayfield[name=grand_total_amount_display]").setValue(grandTotalAmount.toFixed(2));
		form.down("hiddenfield[name=total_amount]").setValue(totalAmount);
		form.down("hiddenfield[name=grand_total_amount]").setValue(grandTotalAmount);

	},
	addRow: function(btn) {
		var store = btn.up('grid').getStore();
		var model = Ext.create("App.model.QuotationDetail");
		model.set("sale_quotation_id", null);
		store.add(model);
	},
	search: function(field) {
		var store = this.getSaleQuotationStore();
		var params = {
			search_string: field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},


	add: function(btn) {
		var conatiner = btn.up('quotationIndex');
		var form = conatiner.down('quotationForm'),
			me = this;
		form.getForm().reset(true);
		form.down("combo[name=lead_id]").hide();
		form.down('checkbox[name=is_vat]').checked = false;
		this.getSaleQuotationDetailStore().removeAll();
		conatiner.setActiveItem(form);

		//  function for set code
		Util.ajax("/Code/get_code", {
			n_type: 'QUOTATION'
		}, me.setCode, form);
	},
	setCode: function(obj, form) {

		if (obj.success) {
			var txtCode = form.down("textfield[name=sale_quotation_no]");
			// check form is do action for add new or edit
			if (form.getRecord()) {
				// for edit form
				if (obj.is_manaul) {

					txtCode.setReadOnly(false);
				} else {
					txtCode.setReadOnly(true);
				}

			} else {
				// for add new form
				if (obj.is_manaul) {
					txtCode.setReadOnly(false);
					txtCode.setValue('');
					txtCode.focus(true, 200);
				} else {
					txtCode.setValue(obj.code);
					txtCode.setReadOnly(true);
					form.down('combo[name=customer_id]').focus(true, 300);
				};

			};

		} else {
			Ext.Msg.alert("Error", "extjs Can't Get Code");
		};
	},

	edit: function(btn) {

		var conatiner = btn.up('quotationIndex');
		var form = conatiner.down('quotationForm');
		var record = Util.getRecord(btn), me = this	;


		if (record && record.get("status") == "D") {
			form.getForm().reset(true);
			form.loadRecord(record);
			if (record.get('tax_percentag') > 0) {
				form.down('checkbox[name=is_vat]').checked = true;
			
			};
			this.getSaleQuotationDetailStore().load({
				params: {
					quotation_id: record.get('id')
				}
			});
			conatiner.setActiveItem(form);

			//  function for set code
			Util.ajax("/Code/get_code", {
				n_type: 'QUOTATION'
			}, me.setCode, form);
		} else {
			Util.msg("Quotation can edit in status Draft only .")
		};

	},
	save_description:function(btn){
		
		var form = btn.up('window').down('form').getForm(),
		frm = btn.up('window').down('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSaleQuotationDetailStore();

  		if(form.isValid()){
  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.Contact');
  				model.set(values);
  				store.add(model);
  			};
  			me.windowCancel(btn);

  		}else{
  			Util.msg('Please entry require field');
  		}
	},
	save: function(btn) {

		var form = btn.up('form').getForm(),
			frm = btn.up('form'),
			me = this,
			values = form.getValues(),
			record = form.getRecord(),
			store = me.getSaleQuotationStore();

		if (form.isValid()) {


			
			if (record) {
				// get delete record from tmp store and add to the real store for submit to server
				var storeQuotationDetial = me.getSaleQuotationDetailStore();
				me.storeDetailTmp.each(function(rec) {
					storeQuotationDetial.add(rec);
				});

				// reset value
				me.storeDetailTmp.removeAll();

				values["sale_quotation_detail_attributes"] = Util.getItemStore(me.getSaleQuotationDetailStore());


				record.set(values);
			} else {
				var model = Ext.create('App.model.Quotation');
				values["sale_quotation_detail_attributes"] = Util.getItemStore(me.getSaleQuotationDetailStore());
				model.set(values);
				store.add(model);
			};

			var recs = store.getModifiedRecords();
			if (recs.length > 0) {

				Ext.MessageBox.wait("Please extjs Proccessing Data.....", "Please Wait")
			};

			
			store.sync({
				success: function() {
					Ext.MessageBox.hide();
					me.cancel(btn);				
					App.app.getStore("combo.Quotation").load() ;


				},
				failure: function(batch ,option) {
					Ext.MessageBox.hide();
	                store.rejectChanges();

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
		var conatiner = btn.up('quotationIndex');
		var grid = conatiner.down('grid[name=index]');
		this.storeDetailTmp.removeAll();
		conatiner.setActiveItem(grid);
	}



})
