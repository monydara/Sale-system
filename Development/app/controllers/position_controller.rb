class PositionController < ApplicationController
	@@common = Common.new
	def index
		data = Position.where(is_deleted:false)
		render @@common.returnPaginate(data, params[:page],params[:limit])
	end

	def combo
		data = Position.where(is_deleted:false)
		render json:{ data:data , success:true}
	end

	def create
		data = Position.new(permit_data)
		data.is_deleted = false
		data.created_by = session[:user_id]
		data.save
		if data.valid?
			render json:{ data:data , success:true}
		else
			render json:{ error:data.errors, success:false}
		end

	end

	def update
		data = Position.find(params[:id])		
		data.update_attributes(permit_data)
		if data.valid?
			render json:{data:data, success:true}
		else
			render json:{error:data.errors, success:false}
		end
	end
	
	def destroy
		data = Position.find(params[:id])
		data.update_attributes(is_deleted:true)
		render json:{ data:data , success:true}
	end

	private
	def permit_data
		params.permit(
			:id,
			:name,
			:description
		)
		
	end
end
