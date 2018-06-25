class UmsController < ApplicationController
	@@common = Common.new
	def index
		data = Ums
		if !params[:string].nil?
			text = "%"+params[:string]+"%"
			data = data.where(" code like '#{text}' or name like '#{text}'")
		end
		render @@common.returnPaginate(data, params[:page],params[:limit])
	end

	def create
		data = Ums.new(permit_data)
		if check_code_exist(data.code) == true
			render json:{message:"UM code already existed!", success:false}
		else
			data.save
			if data.valid?
				render json:{data:data, success:true}
			else
				render json:{error:data.errors, success:false}
			end
		end
	end

	def update
		data = Ums.find(params[:id])

		old_code = data.code
		if old_code.to_s != params[:code].to_s
			if check_code_exist(params[:code].to_s) == true
				render json:{message:"Item code already existed!", success:false}
				return 0
			end
		end

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
		data = Ums.all
		render json:{ data:data , success:true}
	end

	private
	def check_code_exist(code)
		result = false
		um = Ums.find_by code:code
		if !um.nil?
			result = true
		end
		return result
	end

	def permit_data
		params.permit(

			:code,
			:name,
			:abbreviation,
			:remark,
			:create_by,
			:modify_by
			)
	end
end
