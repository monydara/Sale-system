module TransferFixAssetHelper
	def self.save_to_stock_transaction_to_location(data, user_id, to_location_id, from_location_id, ref_no, success , message)
		begin
			StockTransaction.transaction do
				data.transfer_stock_detail.each_with_index do |d|
					item = d.items
					total_qty = 0
					open_qty =0
					remain_qty =0
					last_transaction = StockTransaction.where(item_id:d.item_id).last

					if !last_transaction.nil?
						open_qty = last_transaction.remain_qty
						remain_qty =0
					end
					data = StockTransaction.new()
					data.transaction_id = d.id
					data.transaction_type_id =5 # transactioin_type_id = 5 is a type of transfer stock
					data.ref_no = ref_no
					data.date= DateTime.now()
					data.item_id = d.item_id
					data.serial_no =d.serial_no
					data.open_qty = open_qty
					data.remain_qty = remain_qty
					data.qty = -1
					data.um_id = d.um_id
					data.total_qty = total_qty
					data.input_cost = 0
					data.avg_cost = 0
					data.last_value= 0
					data.total_value=  0
					data.created_by= user_id 
					data.location_id=  to_location_id

					data.save

					data1 = StockTransaction.new()
					data1.transaction_id = d.id
					data1.transaction_type_id =5 # transactioin_type_id = 5 is a type of transfer stock
					data1.ref_no = ref_no
					data1.date= DateTime.now()
					data1.item_id = d.item_id
					data1.serial_no =d.serial_no
					data1.open_qty = open_qty
					data1.remain_qty = remain_qty
					data1.qty = 1
					data1.um_id = d.um_id
					data1.total_qty = total_qty
					data1.input_cost = 0
					data1.avg_cost = 0
					data1.last_value= 0
					data1.total_value=  0
					data1.created_by= user_id 
					data1.location_id=  from_location_id

					data1.save
				end
			end

		return true
	rescue Exception => e
		message = e.message
		success = false
		puts "======= ERROR :"+ e.message
		return false
			
		end
			
	end
	def self.save_to_stock_transaction_from_location(data, user_id, from_location_id, success , message)
		begin
			StockTransaction.transaction do
				data.transfer_stock_detail.each_with_index do |d|
					item = d.items
					total_qty = 1
					open_qty =0
					remain_qty =0
					last_transaction = StockTransaction.where(item_id:d.item_id).last

					if !last_transaction.nil?
						open_qty = last_transaction.remain_qty
						remain_qty = open_qty + total_qty
					end
					data = StockTransaction.new()
					data.transaction_id = d.id
					data.transaction_type_id =5 # transactioin_type_id = 5 is a type of transfer stock
					data.ref_no = d.ref_no
					data.date= DateTime.now()
					data.item_id = d.item_id
					data.serial_no =d.serial_no
					data.open_qty = open_qty
					data.remain_qty = remain_qty
					data.qty = -1
					data.um_id = d.um_id
					data.total_qty = total_qty
					data.input_cost = 0
					data.avg_cost = 0
					data.last_value= 0
					data.total_value=  0
					data.created_by= user_id 
					data.location_id=  from_location_id

					data.save
				end
			end

		return true
	rescue Exception => e
		message = e.message
		success = false
		puts "======= ERROR :"+ e.message
		return false
			
		end
			
	end

	def self.remove_item_transaction(transaction)
		begin
			StockTransaction.transaction do 
				transaction.transfer_stock_detail.each_with_index do |d|
					StockTransaction.where( transaction_id:d.id, transaction_type_id:5 ).destroy_all
				end

				# CustomerTransaction.where( transaction_id:invoice.id, transaction_type_id:2 ).destroy_all
			end
			
			return true 
		rescue Exception => e
			puts "===========ERROR : "+e.message
			return false 
		end
	end
	def self.CheckSotckAvaible(stock_transaction, from_location_id)
		begin
			StockTransaction.transaction do
			 	stock_transaction.transfer_stock_detail.each_with_index do |d|
			 		check_qty_stock = StockTransaction.where(location_id:from_location_id, serial_no:d.serial_no, item_id:d.item_id).sum :qty

					 	if check_qty_stock <=0 
					 		return false
					 	 else
					 	 	return true
					 	end
			
			 	end
			end
		rescue Exception => e 
			puts "============ERROR: "+e.message
			return false	
			
		end
	end
	

end
