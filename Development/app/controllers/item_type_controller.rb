class ItemTypeController < ApplicationController
	def index
		
	end

	def combo
		data = ItemType.all
		render json:{ data:data , success:true}
	end
end
