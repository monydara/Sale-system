 Ext.define('App.controller.sale.Invoice', {
	extend: 'Ext.app.Controller',
	views: [
		'sale.invoice.Index',
		'sale.invoice.Frm',
        'sale.invoice.Currency'

	],
	stores: [
		'sale.Invoice',
		'sale.InvoiceDetail',

		'combo.Quotation',

		'combo.Item',
		'combo.Customer',
		'combo.ItemPrice',
		'combo.SaleRepresentative'
	],
	init: function() {

		this.control({
			'invoiceIndex button[action=Add]': {
				click: this.add
			},
			'invoiceIndex button[action=Edit]': {
				click: this.beforeEdit
			},
			'invoiceIndex textfield[name=Search]': {
				change: this.search
			},
			'invoiceIndex button[action=Submit]': {
				click: this.submit
			},
			'invoiceIndex button[action=Print]': {
				click: this.print
			},
			'invoiceIndex button[action=VoidInvoice]': {
				click: this.beforeVoid
			},

			'invoiceForm button[action=Save]': {
				click: this.save
			},
			'invoiceForm button[action=Cancel]': {
				click: this.cancel
			},
			// grid  event
			'invoiceForm button[action=AddItem]': {
				click: this.addRow
			},

			'invoiceForm grid': {
				edit: this.setRecord,
				beforeedit: this.filterItemPrice
			},
			'invoiceForm numberfield[name=tax_percentag]': {
				change: this.getTax
			},

			'invoiceForm combo[name=sale_quotation_id]': {
				select: this.selectQuotation
			},
			'invoiceForm numberfield[name=discount_amount]': {
				blur: this.setDiscount
			},
         "invoiceForm combo[name=sale_quotation_id]":{
            select : this.loadDataQuotationDetail
         }



		});
	},
	itemRecord: {},
	umRecord: {},
   loadDataQuotationDetail:function(combo , records){
      var rec = records[0];
      var me = this ;
      console.log(rec);
      if (rec.data.customer)
      combo.up("form").down("combo[name=customer_id]").setValue(Ext.create("App.model.Customer",{
            id:rec.data.customer.id ,
            name:rec.data.customer.name
         }));
      Util.ajax("SaleQuotation/get_item_detail", {quotation_id: rec.id } ,me.loadDataDetail )
   },
   loadDataDetail:function(obj ){
      var data = obj.data ;
      var store =  App.app.getController('sale.Invoice').getSaleInvoiceDetailStore();
      store.removeAll();
      data.forEach(function(rec){
         var model = Ext.create("App.model.InvoiceDetail");
         model.set(rec);
         store.add(rec);
      });
   },
	setDiscount:function(field){
       var form =  field.up("form");
		var grid =form.down("grid");
		var value = field.getValue();


		this.setTotalAmountByCurrency(grid);
	},

	selectQuotation: function(combo, records) {
		var record = records[0];
		var values = record.data,
			form = combo.up("form");
		form.getForm().setValues(values);
		var id = record.get('id');
		var me = this;


		form.down("displayfield[name=total_amount_display]").setValue((values.total_amount));
		form.down("displayfield[name=grand_total_amount_display]").setValue((values.grand_total_amount));


		Util.ajax("/SaleQuotation/get_item_detail", {
			quotation_id: id
		}, me.loadStoreQuotationDetail, me);
	},
	loadStoreQuotationDetail: function(obj, me) {
		var store = me.getSaleInvoiceDetailStore();
		store.removeAll();
		obj.data.forEach(function(r) {
			var model = Ext.create("App.model.InvoiceDetail");
			r.id = null;
			model.set(r);
			store.add(model);
		});
	},
	storeDetailTmp: Ext.create('App.store.sale.InvoiceDetail'),
	print: function(btn) {
		var record = Util.getRecord(btn, "Please Select Invoice For Print");
		if (record) {
			window.open("/SaleInvoice/print_invoice.pdf?id=" + record.get('id'));
		};
	},
	voidInvoice: function(btn, me ) {
		var conatiner = btn.up('invoiceIndex');
		var form = conatiner.down('invoiceForm');
		var record = Util.getRecord(btn);
		if (record) {

			Ext.MessageBox.confirm('Confirm', 'Are you sure to Void this Invoice?', function(btn) {
				if (btn == 'yes') {
					Util.ajax("/SaleInvoice/void",{ id: record.get("id")}, me.afterVoid , me) ;

				}
			});


		} else {
			Ext.MessageBox.hide();
			Util.msg("Please Select Invoice For Void");
		};

	},
	afterVoid:function(obj , me ){
		Ext.MessageBox.hide();

		me.getSaleInvoiceStore().load();
		Ext.MessageBox.show({
			title: 'Saved',
			msg: 'Invoice Void Success.',
			icon: Ext.MessageBox.INFO,
			buttons: Ext.Msg.OK
		});
	},

	beforeVoid:function(btn){
		var record = Util.getRecord(btn),
			me = this;
			Ext.MessageBox.wait("Pleae wiat sytem processing.........", "Saving Data")

		if (record.get("status") == "V") {
			Ext.MessageBox.hide();

			Util.msg("This record is already Void");
		} else{
				// check invoice before edit
			Util.ajax("ReceivePayment/check_payment",{invoice_id:record.get('id')}, me.checkVoidInvoice , {me:me , btn:btn}  );

		};
	},
	checkVoidInvoice:function(obj , param){
		if (obj.dataCount == 0) {
			//  data can edit
			param.me.voidInvoice( param.btn ,param.me);
		}else{
			// invoice can't edit
			Ext.MessageBox.hide();

			Util.msg("This Invoice already Paid can not Void ");
		};

	},
	submit: function(btn) {
		var conatiner = btn.up('invoiceIndex');
		var form = conatiner.down('invoiceForm');
		var record = Util.getRecord(btn),
			me = this;
		if (record) {
			if (record.get("status") == "D") {
				Ext.MessageBox.confirm('Confirm', 'Are you sure to submit this Invoice?', function(btn) {
					if (btn == 'yes') {
						record.set("status", "S");
						me.getSaleInvoiceStore().sync();
						Ext.MessageBox.show({
							title: 'Saved',
							msg: 'Invoice Submit Success.',
							icon: Ext.MessageBox.INFO,
							buttons: Ext.Msg.OK
						});
					}
				});
			} else {
				Util.msg("Invoice Can Submit In Status Draft only");
			}

		} else {
			Util.msg("Please Select Invoice For Submit");
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
				me.setTotalAmountByCurrency(grid);

			}
		});

	},
	getTax: function(field) {
		var grid = field.up('form').down("grid");
		this.setTotalAmountByCurrency(grid);
	},
	filterItemPrice: function(editor, e) {
		var grid = e.grid,
			me = this;
		var record = grid.getStore().getAt(e.rowIdx);

		switch (e.colIdx) {
			case 3:
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
        // change code
			case 1:
				getRecordComboSetToGrid(editor, e, me, record);
				break;
            // change item name
            case 2:
				getRecordComboSetToGrid(editor, e, me, record);
				break;
		// change um
            case 3:
                setValuePrice(editor, e, me, record);
				break;
        // change Qyt
			case 4:
                setValueAmount(editor, e, me, record);
				break;
        //change price
			case 5:
				setValueAmount(editor, e, me, record);
				break;
		// change Discount
			case 6:
				setValueAmount(editor, e, me, record);
				break;
			default:

		}
		// ============== additional function
		function setValueAmount(editore, e, me, record) {

			if (record.get("qty") > 0 ) {
				var totalAmount = record.get("price") * record.get("qty") ;
				var disPercentage = record.get('dis_percentage');
				var grandTotal = totalAmount ;
				if(disPercentage > 0 ){
                    var disAmount  = totalAmount *disPercentage/100;
                    grandTotal = totalAmount - disAmount ;
				}



				record.set("extent_price",grandTotal );
                record.set("total_qty", record.get("qty") *record.get("multiplier"));
                record.set("total_qty", record.get("qty") *record.get("multiplier"));

				me.setTotalAmountByCurrency(e.grid);

			}else{
				Util.msg("QTY must be bigger than 0");
				record.set("qty" , 1);
				record.set("extent_price", record.get("price") * 1);
                record.set("total_qty",1 *record.get("multiplier"));
                record.set("dis_percentage",0);

				me.setTotalAmountByCurrency(e.grid);
			};


		}

		function setValuePrice(editor, e, me, record) {
			var rec = me.umRecord;
			if (me.umRecord.data) {
				record.set("multiplier" , rec.get("multiplier") );
				record.set("price", rec.get("price"));
				record.set("total_qty", record.get("qty") *rec.get("multiplier"));

				record.set("extent_price", rec.get("price") * record.get("qty"));
				record.set("um_id", rec.get("um_id"));
				record.set("um", rec.get("um"));
				me.setTotalAmountByCurrency(e.grid);


				me.umRecord = false;
			};

		}

		function getRecordComboSetToGrid(editor, e, me, record) {

			if (me.itemRecord.data) {

				var values = me.itemRecord.data; //get record form grid/combobox

				// e.grid.getView().refresh();
				record.set("item_id", values.id);
				record.set("description", values.memo);
				record.set("qty", 1);
				record.set("um_id", values.um_id);
				record.set("multiplier", 1);
				record.set("total_qty", 1);
				record.set("price", values.price);
				record.set("extent_price", values.price);
				record.set("item_name", values.name);
				record.set("code", values.code);
				record.set("barcode", values.barcode);
				record.set("um", values.um);
				record.set("description", values.sale_description);
				record.set("currency_id", values.currency_id );
				record.set("currency_symbol" , values.symbol);


				me.setTotalAmountByCurrency(e.grid);
				me.itemRecord = false;

			};

		}
	},

     setTotalAmountByCurrency:function (grid) {
         //  sum total amount
         var totalAmountLocalCurrency = 0;
         var grandTotalAmountLocalCurrency = 0 ;
         var totalAmoutByCurrency = {};
         var form = grid.up("form");
         var taxRate = form.down("numberfield[name=tax_percentag]").getValue();

         // == summary by currency to amount
         grid.getStore().each(function(rec) {
             // sum by currency
             var amount = rec.get("extent_price") * 1;

             var amountByCurrency = totalAmoutByCurrency[rec.get("currency_id")] ;
            if(amountByCurrency > 0){
                amountByCurrency += amount;
            }else{
                amountByCurrency = amount;
            }
             totalAmoutByCurrency[rec.get("currency_id")] = amountByCurrency;

         });

         //---set to value to total amount by currency form
         for(var index in totalAmoutByCurrency){
             var subTotal = totalAmoutByCurrency[index] ;
             var grandTotalAmount = subTotal ;
             var discounAmount = form.down("numberfield[name=discount_amount_"+index+"]").getValue();

             if (discounAmount > 0) {
                 grandTotalAmount =subTotal -discounAmount ;
             }
             if (taxRate > 0) {
                 var taxAmount = (taxRate * grandTotalAmount / 100);
                 form.down("numberfield[name=tax_amount_"+index+"]").setValue(taxAmount);

                 grandTotalAmount = grandTotalAmount + taxAmount;
             }

             form.down('textfield[name=sub_total_'+index+']').setValue(subTotal);
             form.down('textfield[name=grand_total_'+index+']').setValue(grandTotalAmount);

             // convert to total currency

             totalAmountLocalCurrency +=App.controller.GlobalFn.exchagneLocalRateIn(subTotal , index)


         }

         // // calculate tax for local currency
         var discounAmount = form.down("numberfield[name=discount_amount]").getValue();



         if (discounAmount > 0) {
             grandTotalAmountLocalCurrency =totalAmountLocalCurrency -discounAmount ;
         };


         if (taxRate > 0) {
             var taxAmount = (taxRate * grandTotalAmountLocalCurrency / 100);
             form.down("hiddenfield[name=tax_amount]").setValue(taxAmount);
             grandTotalAmountLocalCurrency = grandTotalAmountLocalCurrency + taxAmount;
         };




         // // grand total
         form.down("displayfield[name=total_amount_display]").setValue(totalAmountLocalCurrency.toFixed(2));
         form.down("displayfield[name=grand_total_amount_display]").setValue(grandTotalAmountLocalCurrency.toFixed(2));
         form.down("hiddenfield[name=total_amount]").setValue(totalAmountLocalCurrency);
         form.down("hiddenfield[name=grand_total_amount]").setValue(grandTotalAmountLocalCurrency);

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
		var discounAmount = form.down("numberfield[name=discount_amount]").getValue();



		if (discounAmount > 0) {
			totalAmount =totalAmount -discounAmount ;
		};

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
		var model = Ext.create("App.model.InvoiceDetail");
		model.set("sale_invoice_id", null);
		store.add(model);
	},
	search: function(field) {
		var store = this.getSaleInvoiceStore();
		var params = {
			search_string: field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},


	add: function(btn) {
		var conatiner = btn.up('invoiceIndex');
		var form = conatiner.down('invoiceForm'),
			me = this;
		form.getForm().reset(true);
		this.getSaleInvoiceDetailStore().removeAll();
		conatiner.setActiveItem(form);

		//  function for set code
		Util.ajax("/Code/get_code", {
			n_type: 'INVOICE INCLUDE TAX'
		}, me.setCode, form);
	},
	setCode: function(obj, form) {

		if (obj.success) {
			var txtCode = form.down("textfield[name=invoice_no]");
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
			Ext.Msg.alert("Error", "System Can't Get Code");
		};
	},
	beforeEdit:function(btn){

		var record = Util.getRecord(btn),
			me = this;
			// check invoice before edit
		if (record.get("status") == "V") {
			Util.msg("Record Can not edit for invoice already Void");
		}else{

			Util.ajax("ReceivePayment/check_payment",{invoice_id:record.get('id')}, me.checkInvoice , {me:me , btn:btn}  );
		};
	},
	checkInvoice:function(obj , param){
		if (obj.dataCount == 0) {
			//  data can edit
			param.me.edit( param.btn ,param.me);
		}else{
			// invoice can't edit
			Util.msg("This Invoice already Paid can not edit ");
		};

	},

	edit: function(btn , me ) {

		var conatiner = btn.up('invoiceIndex');
		var form = conatiner.down('invoiceForm');
		var record = Util.getRecord(btn);

		if (record) {
			form.getForm().reset(true);
			form.loadRecord(record);
			this.getSaleInvoiceDetailStore().load({
				params: {
					invoice_id: record.get('id')
				}
			});
			conatiner.setActiveItem(form);

			//  function for set code

			if (record.get("tax_amount") > 0 ) {
				Util.ajax("/Code/get_code", {
					n_type: 'INVOICE INCLUDE TAX'
				}, me.setCode, form);

			}else{
				Util.ajax("/Code/get_code", {
					n_type: 'INVOICE NOT INCLUDE TAX'
				}, me.setCode, form);
			};
			setTimeout(function () {
                me.setTotalAmountByCurrency(conatiner.down("form").down('grid'));
            },1000)


		} else {
			Util.msg("Invoice can edit in status Draft only .")
		};

	},

	save: function(btn) {

		var form = btn.up('form').getForm(),
			frm = btn.up('form'),
			me = this,
			values = form.getValues(),
			record = form.getRecord(),
			store = me.getSaleInvoiceStore();

		if (form.isValid()) {

			if (record) {
				// get delete record from tmp store and add to the real store for submit to server
				var storeInvoiceDetial = me.getSaleInvoiceDetailStore();
				me.storeDetailTmp.each(function(rec) {
					storeInvoiceDetial.add(rec);
				});

				// reset value
				me.storeDetailTmp.removeAll();

				values["invoice_detail_attributes"] = Util.getItemStore(me.getSaleInvoiceDetailStore());


				record.set(values);
			} else {
				var model = Ext.create('App.model.Invoice');
				values["invoice_detail_attributes"] = Util.getItemStore(me.getSaleInvoiceDetailStore());
				model.set(values);
				store.add(model);
			};

			Ext.MessageBox.wait("Pleae wiat sytem processing.........", "Saving Data")
			store.sync({
				success: function() {
					Ext.MessageBox.hide();
					me.cancel(btn);
					store.load();
					App.app.getStore("combo.Invoice").load() ;


				},
				failure: function(batch, option) {
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
				scope: this
			});


		} else {

			Util.msg('Please entry require field');
		}


	},
	cancel: function(btn) {
		var conatiner = btn.up('invoiceIndex');
		var grid = conatiner.down('grid[name=index]');
		this.storeDetailTmp.removeAll();
		conatiner.setActiveItem(grid);
	}



})
