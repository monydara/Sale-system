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

	def self.customer_transaction(invoice , user_id )
		begin
			CustomerTransaction.transaction do

				data = CustomerTransaction.new()

				data.transaction_id=invoice.id 
				data.date=DateTime.now()
				data.transaction_type_id=2
				data.ref_no=invoice.invoice_no
				data.amount=invoice.grand_total_amount
				data.created_by=user_id
				data.customer_id = invoice.customer_id
				data.save
		
				return true 			
			end
		rescue Exception => e
			puts "===========ERROR : "+e.message
			return false 
			
		end
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
