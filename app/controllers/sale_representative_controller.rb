class SaleRepresentativeController < ApplicationController
	@@common = Common.new
	def index
		data = SaleRepresentative
		if !params[:search_string].nil?
			text = "%"+params[:search_string]+"%"
			data = data.where(" first_name like '#{text}' or last_name like '#{text}' or mobile like '#{text}'")
		end
		render @@common.returnPaginate(data, params[:page],params[:limit])
	end
	def combo

		data = SaleRepresentative.where( status:"A")
		text = params[:query]
		if !text.nil?
			data = data.where("first_name like '%#{text}%' or last_name like '%#{text}%'")
		end

		render  json:{ data:data, success:true}
	end
	def create
		data = SaleRepresentative.new(permit_data)
		data.save
		if data.valid?
			render json:{ data:data , success:true}
		else
			render json:{ error:data.errors, success:false}
		end

	end

	def update
		data = SaleRepresentative.find(params[:id])
		data.update_attributes(permit_data)
		if data.valid?
			render json:{data:data, success:true}
		else
			render json:{error:data.errors, success:false}
		end
	end

	def destroy

	end

	private
	def permit_data
		params.permit(
			:id,
			:first_name,
			:last_name,
			:mobile,
			:phone,
			:email,
			:position_id,
			:address,
			:remark,
			:status,
			:register_date
		)

	end
end
