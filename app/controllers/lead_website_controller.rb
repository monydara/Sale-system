class LeadWebsiteController < ApplicationController
	@@common = Common.new
	def index
		@@service = LeadPermission::Service.new()
		user_id =  @current_user.id
		user_permission = @@service.get_user_permission user_id
		if user_permission==true
			data = Lead.joins(:area, :contact,:look_up, :sale_representative, :source, :user ).where("leads.flag=#{3}").select("leads.* , areas.name 'area_name',
		 leads.contact_id contact , contacts.contact_name , contacts.contact_mobile ,
		 look_ups.name status_name, concat(sale_representatives.first_name,' ',sale_representatives.last_name) as leadowner, sources.name as source_name, concat(users.first_name,' ',users.last_name) as username")
		else
			data = Lead.joins(:area, :contact,:look_up, :sale_representative, :source, :user  ).where("leads.created_by=#{user_id} and leads.flag=#{3}").select("leads.* , areas.name 'area_name',
		 leads.contact_id contact , contacts.contact_name , contacts.contact_mobile ,
		 look_ups.name status_name, concat(sale_representatives.first_name,' ',sale_representatives.last_name) as leadowner, sources.name as source_name, concat(users.first_name,' ',users.last_name) as username")
		end
		
		if !params[:string].nil?
			text = '%'+params[:string]+'%'
			data = data.where(" leads.name like '#{text}' or legal_name like '#{text}' or leads.phone like '#{text}'  ")
		end
		render @@common.returnJoinPaginate(Lead ,data, params[:page],params[:limit])
	end

	# def create
	# 	Lead.transaction do
	# 		user_id =  session[:user_id]
	# 		data = Lead.new(permit_data)
	# 		data.code = @@common.get_code_with_config("LEAD" , "")
	# 		data.created_by = user_id
	# 		data.flag = 3
	# 		if data.valid?
	# 			data.save

	# 			render json:{ data:data, success:true}
	# 		else
	# 			render json:{ message:data.errors.full_messages.first, success:false}
	# 			raise ActiveRecord::Rollback
	# 		end
	# 	end

	# end
	# def update
	# 	Lead.transaction do
	# 		user_id =  session[:user_id]
	# 		data = Lead.find(params[:id])
	# 		data.update_attributes(permit_data)
	# 		data.update(modified_by:user_id)
	# 		if data.valid?
	# 			data.save 
	# 			render json:{data:data, success:true}
	# 		else
	# 			render json:{message:data.errors.full_messages.first, success:false}
	# 			raise ActiveRecord::Rollback
	# 		end
	# 	end
	# end

	def destroy

	end
	private
	def permit_data
		params.permit(
			:id,
			:name,
			:legal_name,
			:industry,
			:lead_area_id,
			:flag,
			:phone,
			:email,
			:mobile,
			:website,
			:address,
			:status,
			:source,
			:lead_owner,
			:next_contact_by,
			:next_contact_date,
			:lead_purpose,
			:contact_id,
		)

	end
end
