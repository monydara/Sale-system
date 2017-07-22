class ItemPriceController < ApplicationController

	def combo
		data = []
		if !params[:item_id].nil?			
			data = ItemPrice.joins( :ums ).where( item_id:params[:item_id] ).select(" item_prices.* , ums.name 'um' ")
		end

		render json:{ data:data , success:true }
		
	end

end
