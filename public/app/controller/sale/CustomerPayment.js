
Ext.define('App.controller.sale.CustomerPayment', {
	extend: 'Ext.app.Controller',
	views:[
		'sale.customerPayment.Index',
		'sale.customerPayment.Frm',
		'sale.customerPayment.PaymentFieldSet'

	],	
	stores:[
		'sale.CustomerPayment',
		'sale.CustomerPaymentDetail',
		'combo.Area',
		'combo.Customer'
	],
	init: function() {
		
	    this.control({
	    	//============ grid action
	    	'customerPaymentIndex button[action=Add]':{
	    		click: this.add
	    	},
	    	'customerPaymentIndex button[action=Edit]':{
	    		click: this.edit
	    	},
	    	'customerPaymentIndex textfield[name=Search]':{
	    		change: this.search
	    	},
	    	'customerPaymentIndex button[action=Print]':{
	    		click: this.print
	    	},
	    	//============== form action 
	    	'FormCustomerPayment button[action=Save]':{
	    		click: this.save
	    	},
	    	'FormCustomerPayment button[action=Cancel]':{
	    		click: this.cancel
	    	},
	    	'FormCustomerPayment combo[name=customer_id]':{
	    		select: this.loadInvoice
	    	},
	    	'FormCustomerPayment combo[name=payment_type]':{
	    		change: this.changePaymentType
	    	},
            'FormCustomerPayment button[action=Apply]':{
                click: this.applyPayment
            },
	    	// ===== grid action 
	    	
	    	'FormCustomerPayment grid': {
				edit: this.setRecord,				
			},
			'FormCustomerPayment button[action=payAll]': {
				click: this.payAll				
			},
			'customerPaymentPaymentFieldSet numberfield':{
                specialkey:this.applyPaymentEnter
			}

	    });
	},
    applyPaymentEnter:function(f,e){
        if (e.getKey() == e.ENTER) {
            this.applyPayment(f);
		}
    },
    applyPayment:function(btn) {
		var form = btn.up("form");
		var me = this;
		if(form.isValid()){
			var values = form.getValues();
			var grid = form.down('grid');
			var store = grid.getStore();
			for(var i in values){

				if(i.search("currency") ==0 ){//--- get currency entry from form
					//-- split name to get id of currency
					var currency_id = i.split("_")[1];
					var amount =Number(values[i]);


                    store.each(function(record){ //-- loop for payment
                        var unpaidAmount =  record.get("unpaid_amount");
                       if(amount > 0 && record.get("currency_id") == currency_id) {

                       		if(amount < unpaidAmount ){
                                record.set("amount" , amount );
                                record.set("last_balance" , unpaidAmount-amount);
                                amount = 0 ;
							}else{
                       			amount = amount - unpaidAmount;
                                record.set("amount" ,unpaidAmount );
                                record.set("last_balance" , 0);
							}
					   }else if(amount == 0 && record.get("currency_id") == currency_id){
                           record.set("amount" ,0);
                           record.set("last_balance" , unpaidAmount );
					   }
                    });

				}
			}

            me.setTotalAmountPay(grid);

		}
	
    },
	changePaymentType:function(field){
		var value = field.getValue();
		var form = field.up("form");
		var textfield = form.down("textfield[name=check_no]");
		if (value == "CA") {
			textfield.hide();
		}else{
			textfield.show();
		};
	},
    print: function(btn) {
        var record = Util.getRecord(btn, "Please Select Invoice For Print");
        if (record) {
            window.open("/Prints/print_reciept.html?id=" + record.get('id'));
        };
    },
	// print: function(btn) {
	// 	var record = Util.getRecord(btn, "Please Select Receipt For Print");
	// 	if (record) {
	// 		window.open("/CustomerPayment/print.pdf?id=" + record.get('id'));
	// 	};
	// },
	payAll:function(btn){
		var me = this ;
		var grid = btn.up('grid');
		var store = grid.getStore();
		store.each(function(record){
			record.set("amount" , record.get("unpaid_amount"));
		});

		me.setTotalAmountPay(grid);

	},
	setRecord:function(editor, e){
		var grid = e.grid,
			me = this;
		var record = grid.getStore().getAt(e.rowIdx);
		
		switch (e.field) {

			case "amount":
				setValueAmount(editor, e, me, record);
				break;		
			default:

		}

		function setValueAmount(editor, e, me, record){
			var unpaid = record.get('unpaid_amount');
			var amount = record.get('amount');
			var balance = unpaid - amount ;
			record.set("last_balance" , balance);
			me.setTotalAmountPay(e.grid);

		}

	},

	setTotalAmountPay:function(grid){
		var store =grid.getStore();
		var totalByCurrency = [] ;
		store.each(function(record){

			var data = record.getData();
			console.log(data); 
            totalByCurrency[data.currency_id] =Ext.Number.from(totalByCurrency[data.currency_id] , 0)+Number(data.amount);

		});

		var form = grid.up('form');
		var grandTotalAmount = 0  ;
        for( i in totalByCurrency){
            form.down("displayfield[name=total_currency_"+i+"]").setValue(totalByCurrency[i] );
            grandTotalAmount+=App.conf.GlobalFn.exchagneLocalRateIn(totalByCurrency[i] , i );
        }
        form.down("hidden[name=total_amount]").setValue(grandTotalAmount);


	},
	loadInvoice:function(combo , records ){
		var me = this ;
		var record =  records[0] ; 
		var customerId = record.get('id');
		var form = combo.up("form");

		this.getSaleCustomerPaymentDetailStore().load({
			params:{
				customer_id:customerId
			},
            callback: function(records, operation, success) {
               me.summaryTotalUnpaid(records , form);
            },
            scope: this
		});

	},
    summaryTotalUnpaid:function (records , form) {
		var totalByCurrency = [];
		for(var i = 0 ; i< records.length ; i++){
          	var rec = records[i].data ;
            totalByCurrency[rec.currency_id] =Ext.Number.from(totalByCurrency[rec.currency_id] , 0)+Number(rec.unpaid_amount)


		}

		for( i in totalByCurrency){
			form.down("numberfield[name=currency_"+i+"]").setMaxValue(totalByCurrency[i]);
			form.down("displayfield[name=currency_"+i+"]").setValue(totalByCurrency[i] );
		}

    },
	search:function(field){
		var store = this.getSaleCustomerPaymentStore();
		var params={
			string:field.getValue()
		};

		Util.loadStoreSearch(store, params);
	},
	

	add:function(btn){
		var conatiner = btn.up('customerPaymentIndex'),
		me = this;
		var form = conatiner.down('FormCustomerPayment');
		form.getForm().reset(true);
		form.down('combo[name=customer_id]').setReadOnly(false);
		form.down('textfield[name=invoiceNo]').setReadOnly(false);

		this.getSaleCustomerPaymentDetailStore().removeAll();
		
		conatiner.setActiveItem(form);

		//  function for set code
		Util.ajax("/Code/get_code", {
			n_type: 'RECIEPT INCLUDE TAX'
		}, me.setCode, form);

	},
	setCode: function(obj, form) {

		if (obj.success) {
			var txtCode = form.down("textfield[name=receipt_no]");
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
	edit: function(btn){

		var conatiner = btn.up('customerPaymentIndex');
		var form = conatiner.down('FormCustomerPayment');
		var record = Util.getRecord(btn);
		
		if (record) {			
			var createAt =new Date(record.get("created_at")); 
			var curDate = new Date() ;
			if (createAt.getDate() == curDate.getDate() && createAt.getMonth() == curDate.getMonth() && createAt.getFullYear() ==curDate.getFullYear() ) {

				// ==========  receipt can edit by today
				form.getForm().reset(true);
				form.loadRecord(record);

				var totalAmount = Number(record.get("total_amount") );
				form.down('combo[name=customer_id]').setReadOnly(true);
				form.down('textfield[name=invoiceNo]').setReadOnly(true);

				form.down('displayfield[name=total_amount]').setValue(totalAmount.toFixed(2));
				this.getSaleCustomerPaymentDetailStore().load({
					params:{
						payment_id:record.get('id')
					}
				});

				conatiner.setActiveItem(form);
			}else{
				Util.msg("Reciept can edit in on create day only ");
			};
		};
		
	},

	save :function(btn){

		var form = btn.up('form').getForm(),
		frm = btn.up('form') ,
  		me = this,
  		values = form.getValues(),
  		record = form.getRecord(),
  		store = me.getSaleCustomerPaymentStore(), 
  		storeDetail = me.getSaleCustomerPaymentDetailStore();

  			    	          				    	          		
  		if(form.isValid()){
  			debugger;
  			storeDetail.each(function(record){
  				if (record) {
  					console.log(Number(record.get("amount")) , "-- invoice list amount")
	  				if (Number(record.get("amount")) == 0 ) {
  						console.log("--- recod have removed")
	  					storeDetail.remove(record);
	  				};
  				};
  			});
            debugger;
			values["receive_payment_detail_attributes"] = Util.getItemStore(storeDetail);

  			if (record) {
  				record.set(values);
  			} else{
  				var model = Ext.create('App.model.CustomerPayment');
  				model.set(values);
  				store.add(model);
  			};
  			// store.sync();
  			// me.cancel(btn);
			Ext.MessageBox.wait("Pleae wiat sytem processing.........", "Saving Data"); 

  			store.sync({
				success: function() {
					Ext.MessageBox.hide();
					me.cancel(btn);
					store.load();

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

  		}else{
  			Util.msg('Please entry require field');
  		}
		

	},
	cancel:function(btn){
		var conatiner = btn.up('customerPaymentIndex');
		var grid = conatiner.down('grid[name=index]');		
		conatiner.setActiveItem(grid);
	}
})