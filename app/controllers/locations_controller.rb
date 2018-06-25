class LocationsController < ApplicationController
	@@common = Common.new
	def index
		data = Locations
		# if !params[:string].nil?
		# 	text = "%"+params[:string]+"%"
		# 	data = data.where(" code like '#{text}' or name like '#{text}'")
		# end
		render @@common.returnPaginate(data, params[:page],params[:limit])
	end

	def create
		data = Locations.new(permit_data)
		data.save
		if data.valid?
			render json:{data:data, success:true}
		else
			render json:{error:data.errors, success:false}
		end
	end

	def update
		data = Locations.find(params[:id])
		data.update_attributes(permit_data)
		if data.valid?
			render json:{data:data, success:true}
		else
			render json:{error:data.errors, success:false}
		end
	end

	def combo
		data = Locations.all
		render json:{data:data, success:true}
	end

	def permit_data
		params.permit(
			:id,
			:name,
			:phone,
			:fax,
			:website,
			:email,
			:address,
			:remark,
			:is_active,
			:create_by,
			:modify_by,
		)
	end
end
