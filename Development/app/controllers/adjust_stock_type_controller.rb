class AdjustStockTypeController < ApplicationController
	def combo
		data = AdjustStockType.all
		render json:{ data:data , success:true}
	end
end
