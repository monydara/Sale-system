class VendersController < ApplicationController
	@@common = Common.new
	def index
		data = Vender
		if !params[:string].nil?
			text = '%'+params[:string]+'%'
			data = data.where(" name like '#{text}' or legal_name like '#{text}' or phone like '#{text}' or contact_name like '#{text}'  ")
		end
		render @@common.returnPaginate(data, params[:page],params[:limit])
	end
	def create
		data = Vender.new(permit_data)
		data.create_by = @current_user.id
		data.save
		if data.valid?
			render json:{ data:data , success:true}
		else
			render json:{ error:data.errors, success:false}
		end

	end

	def update
		data = Vender.find(params[:id])
		data.modify_by = @current_user.id
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
			:name,
			:legal_name,
			:phone,
			:mobile,
			:email,
			:website,
			:address,
			:contact_name,
			:contact_mobile,
			:contact_id_card,
			:contact_email,
			:contact_address,
			:create_by,
			:modify_by
			)
		
	end
end
