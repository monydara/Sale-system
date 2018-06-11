class CustomersController < ApplicationController
	@@common = Common.new
	def index
		data = Customer.joins(:area, :contact)
		if !params[:string].nil?
			text = '%'+params[:string]+'%'
			data = data.where(" customers.name like '#{text}' or legal_name like '#{text}' or phone like '#{text}' or contacts.contact_name like '#{text}'  ").order(created_at:'desc')
		end
		result = data.select("customers.* , areas.name 'area_name' , contacts.id contact ,contacts.contact_name , contacts.contact_mobile ")
		render @@common.returnJoinPaginate(data ,result, params[:page],params[:limit])
	end

	def combo
		text = params[:query]
		@data = Customer.joins(:contact).select("customers.* , customers.contact_id contact ,customers.custom_price_id	custom_price")
		if !text.nil?
			@data = @data.where " name like '%#{text}%'"
		end


		render  json:{ data:@data, success:true}
	end
	def create
		Customer.transaction do
			data = Customer.new(permit_data)
			data.code = @@common.get_code_with_config("CUSTOMER" , "")

			lead_id =data.lead_id
			if !lead_id.nil? && lead_id > 0
				Lead.update_status_converted lead_id
			end

			if data.valid?
				data.save
				render json:{ data:data , success:true}
			else
				render json:{ message:data.errors.full_messages.first, success:false}
				raise ActiveRecord::Rollback
			end
		end
	end

	def update
		Customer.transaction do
			data = Customer.find(params[:id])
			if data.valid?
				data.update_attributes(permit_data)
				render json:{data:data, success:true}
			else
				render json:{ message:data.errors.full_messages.first, success:false}
				raise ActiveRecord::Rollback
			end
		end
	end

	def destroy

	end

	private
	def permit_data
		params.permit(				
				:name,
				:legal_name,
				:customer_type_id,
				:custom_price_id,
				:customer_area_id,
				:vat_tin,
				:phone,
				:mobile,
				:email,
				:website,
				:address,
				:contact_id,
				:lead_id ,
				:is_system_created,
				:create_by,
				:modify_by
		)

	end
end
