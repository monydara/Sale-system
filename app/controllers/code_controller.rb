class CodeController < ApplicationController

	@@common = Common.new
	def index
		data = NextVersion	
		render json:{ data:data.all , success:true}
	end

	def update
		data = NextVersion.find(params[:id])
		data.update_attributes(permit_data)
		if data.valid?
			render json:{data:data, success:true}
		else
			render json:{error:data.errors, success:false}
		end
	end
	
	# get last code from table next version 
	def get_code
		data = []
		is_manaul = false
		code =""

		if !params[:n_type].nil?
			data = NextVersion.find_by n_type:params[:n_type]
			if data.is_manaul #check condition if this menu no need generate form system
				is_manaul = true
			end
			code = @@common.getCode(params[:n_type])
		end
		render json:{ code:code,is_manaul:is_manaul , success:true}
	end

	def destroy
		
	end

	private
	def permit_data
		params.permit(
			:id,
			:n_type,
			:prefix,
			:next_code,
			:degit,
			:is_manaul

			)
		
	end
end
