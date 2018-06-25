class CurrenciesController < ApplicationController
  @@common = Common.new
	def index
		data = Currency
		if !params[:string].nil?
			text = "%"+params[:string]+"%"
			data = data.where(" code like '#{text}' or name like '#{text}'")
		end
		render @@common.returnPaginate(data, params[:page],params[:limit])
	end

	def combo
		data = Currency.all
		render json:{ data:data , success:true}
	end

	def create
		data = Currency.new(permit_data)
		data.save
		if data.valid?
			render json:{ data:data , success:true}
		else
			render json:{ error:data.errors, success:false}
		end

	end

	def update
		data = Currency.find(params[:id])
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
        :name,
        :symbol,
        :abbr,
        :fraction_unit,
        :rate_in,
        :rate_out
		)
	end
end
