module SaleInvoiceHelper
	def self.save_to_stock_transaction(data , user_id , location_id , success , message)
		begin
			StockTransaction.transaction do
				data.invoice_detail.each_with_index do |d|
					item = d.items

			
					total_qty = -1*d.total_qty # transaction deduce stock is oppositive 
					open_qty =  0 
					remain_qty = 0
					
					last_transaction = StockTransaction.where(item_id:d.item_id).last

					if !last_transaction.nil?
						open_qty = last_transaction.remain_qty 
						remain_qty = open_qty + total_qty
					end

					data = StockTransaction.new()

					data.transaction_id= d.id 
					data.transaction_type_id= 2 
					data.ref_no= d.invoice.invoice_no 
					data.date= DateTime.now() 
					data.item_id=  d.item_id 
					data.serial_no= d.serial
					data.open_qty= open_qty 
					data.remain_qty=  remain_qty
					data.qty= d.qty
					data.um_id= d.um_id 
					data.total_qty= total_qty
					data.input_cost= item.cost_avc
					data.avg_cost=  item.cost_avc 
					data.last_value= (remain_qty * item.cost_avc) 
					data.total_value=  (total_qty * item.cost_avc)
					data.created_by= user_id 
					data.location_id=  location_id

					data.save
				end
			end

			return true 
		rescue Exception => e
			message =e.message
			success = false
			puts "===========ERROR : "+e.message
			return false 
		end


	end

	def get_amount_with_tax amount , invoice
		puts '-------'
		puts invoice.tax_percentag
		puts amount


		if !invoice.tax_percentag.nil?
			puts (amount*invoice.tax_percentag)/100
			((amount*invoice.tax_percentag)/100) + amount
		else
			amount
		end


	end

	def self.customer_transaction(invoice , user_id )

			CustomerTransaction.transaction do

				# --- check if set multi currency
				@isMultiCurrency = SysConfig.get_config_by_code("SYS01")
				puts '---------'
				puts @isMultiCurrency
				if @isMultiCurrency == "TRUE"
					#-- loop save by currency
					@inv_detail = invoice.invoice_detail.group(:currency_id).select("currency_id , sum(extent_price) amount")

						@inv_detail.each_with_index do |detail|
							grand_total  =detail.amount+(detail.amount * invoice.tax_percentag / 100)
							insert_customer_transcaction(invoice , user_id , detail.currency_id ,grand_total )
						end


					puts '--------'
					puts @inv_detail

				else
						insert_customer_transcaction(invoice , user_id , currency_id ,invoice.grand_total_amount )

				end

		
				return true 			
			end
	end

	def self.insert_customer_transcaction(invoice , user_id , currency_id , total_amount)
		data = CustomerTransaction.new()

		data.transaction_id=invoice.id
		data.date=DateTime.now()
		data.transaction_type_id=2
		data.ref_no=invoice.invoice_no
		data.created_by=user_id
		data.customer_id = invoice.customer_id
		data.currency_id =currency_id
		data.amount = total_amount
		data.save
	end

	def self.remove_item_transaction(invoice)
		begin
			StockTransaction.transaction do 
				invoice.invoice_detail.each_with_index do |d|
					StockTransaction.where( transaction_id:d.id, transaction_type_id:2 ).destroy_all
				end

				CustomerTransaction.where( transaction_id:invoice.id, transaction_type_id:2 ).destroy_all
			end
			
			return true 
		rescue Exception => e
			puts "===========ERROR : "+e.message
			return false 
		end
	end



end
