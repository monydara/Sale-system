class ItemCategoriesController < ApplicationController
	@@common = Common.new
	def index
		data = ItemCategory
		if !params[:string].nil?
			text = "%"+params[:string]+"%"
			data = data.where(" name like '#{text}'")
		end
		render @@common.returnPaginate(data, params[:page],params[:limit])
	end

	def create
		data = ItemCategory.new(permit_data)
		data.save
		if data.valid?
			render json:{data:data, success:true}
		else
			render json:{error:data.errors, success:false}
		end
	end

	def update
		data = ItemCategory.find(params[:id])
		data.update_attributes(permit_data)
		if data.valid?
			render json:{data:data, success:true}
		else
			render json:{error:data.errors, success:false}
		end
	end

	def destroy
		
	end

	def combo
		data = ItemCategory.all
		render json:{ data:data , success:true}
	end

	private
	def permit_data
		params.permit(
			:id,
			:name,
			:sub_of_id,
			:remark,
			:is_active
			)
	end
end
