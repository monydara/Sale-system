module CustomerPaymentHelper
	@@common = Common.new

	def self.get_amount_receipt(receipt)
		#--- get all amount in by local currency
		total_amount = 0
		receipt.receive_payment_detail.each_with_index do |d|

		end

	end

	def self.get_invioce_detail(customer_id)
=begin
TODO
1- get list all  invoice
2- get paid amount
3- minus with grand total amount
=end

		invoice  = Invoice.get_unpaid_invoice_by_customer customer_id
		if !invoice.nil?
			invoice.each {|d|
				# -- sum paid amount by payment detail condition invoice id and currency id
				paid_amount = ReceivePaymentDetail.get_paid_amount_by_invoice d.invoice_id , d.currency_id

				d.paid_amount = paid_amount[d.invoice_id].nil? ? 0 : paid_amount[d.invoice_id]
				d.unpaid_amount = d.invoice_amount - d.paid_amount
			}
		end

	end
	def self.payment_invoice(receipt, user_id)
		begin
		
			receipt.receive_payment_detail.each_with_index do |d|
				amount = d.amount.to_f
				if amount > 0 					
					@invoice = Invoice.find(d.invoice_id)

					unpaid_amount = @invoice.unpaid_amount.to_f - amount 
					paid_amount = @invoice.paid_amount.to_f + amount
					payment_flag = 2

					if unpaid_amount == 0 || unpaid_amount < 0 
						payment_flag = 3 
					end

					@invoice.update_attributes( paid_amount:paid_amount , unpaid_amount:unpaid_amount , payment_flag:payment_flag)
					if @invoice.valid?				
					else
						return false
					end
				end

			end 
			return true
		rescue Exception => e
			puts "========Error :payment_invoice "+ e.message
			return false
		end

		
	end

	def self.get_code(receipt)
		begin
			# check receipt include tax or not 
			is_include_tax = false 
			reciept_no = 0 
			receipt.receive_payment_detail.each_with_index do |d|
				if d.amount > 0 
					@invoice = Invoice.find(d.invoice_id)
					if @invoice.tax_percentag > 0 
						is_include_tax = true
					end
				end				
			end


			if is_include_tax == true 				
				reciept_no = @@common.get_code_with_config("RECIEPT INCLUDE TAX" , receipt.receipt_no)
			else
				reciept_no = @@common.get_code_with_config("RECIEPT NOT INCLUDE TAX" , receipt.receipt_no)				
			end

			return reciept_no
		rescue Exception => e
			puts "========Error : "+ e.message
			return 0	
		end

		
	end


	def self.check_code_exist( receipt )
		result = false 	
		is_include_tax = false
		receipt.receive_payment_detail.each_with_index do |d|
			if d.amount > 0 
				@invoice = Invoice.find(d.invoice_id)
				if @invoice.tax_percentag > 0 
					is_include_tax = true
				end
			end				
		end


		if is_include_tax == true 
			data = ReceivePayment.find_by_sql("
				select * from invoices i 
				inner join receive_payment_details r on r.invoice_id = i .id 
				inner join receive_payments rp on rp.id = r.receive_payment_id
				where i.tax_percentag > 0 and rp.receipt_no = '#{receipt.receipt_no}' " )
		else
			data =ReceivePayment.where(" 
				select i.tax_percentag from invoices i 
				inner join receive_payment_details r on r.invoice_id = i .id 
				inner join receive_payments rp on rp.id = r.receive_payment_id
				where (i.tax_percentag = 0 or i.tax_percentag is null ) and rp.receipt_no ='#{receipt.receipt_no}'
				")
		end

		if data.count > 0
			result= true # code already exist
		end
		
		return result 

	end

	def self.insert_to_customer_transaction(receipt , user_id )

		receipt.receive_payment_detail.each_with_index do |d|

			data = CustomerTransaction.new()

			data.transaction_id=receipt.id
			data.date=DateTime.now()
			data.transaction_type_id=6
			data.ref_no=receipt.receipt_no
			data.amount=(d.amount.to_f * (-1) )
			data.created_by=user_id
			data.customer_id = receipt.customer_id
			data.currency_id = d.currency_id
			data.save
		end

	end

	def self.update_customer_transaction(receipt , user_id)
		begin
			
			data = CustomerTransaction.find_by transaction_type_id:6,transaction_id:receipt.id
			total_amount = receipt.total_amount.to_f
			amount = (total_amount *(-1))
			data.update_attributes(amount:amount,modify_by:user_id)

			return true
		rescue Exception => e
			puts "======== ERROR:update_customer_transaction "+e.message
			return false
		end
	end


	def self.roll_back_invoice(receipt , user_id)
		begin
			receipt.receive_payment_detail.each_with_index do |d|
				if d.amount > 0 
					@invoice = Invoice.find(d.invoice_id)
					amount = d.amount.to_f 
					unpaid_amount = @invoice.unpaid_amount + amount 
					paid_amount = @invoice.paid_amount - amount 
					@invoice.update_attributes(unpaid_amount:unpaid_amount , paid_amount:paid_amount)

				end				
			end

			return true
		rescue Exception => e
			puts "======== ERROR:roll_back_invoice"+e.message
			return false
		end
		
	end

	def self.check_receipt_is_include_tax(receipt)

		is_include_tax = false 
		receipt.receive_payment_detail.each_with_index do |d|
			if d.amount > 0 
				@invoice = Invoice.find(d.invoice_id)
				if @invoice.tax_percentag > 0 
					is_include_tax = true
				end
			end				
		end

		return is_include_tax
	end
end
