
class SaleQuotationController < ApplicationController
	@@common = Common.new
	def index
		@@service = LeadPermission::Service.new()
		user_id =  session[:user_id]
		user_permission = @@service.get_user_permission user_id
		if user_permission==true
			data = SaleQuotation.includes( :customer, :lead)	
		else
			data = SaleQuotation.includes( :customer, :lead).where("sale_quotations.created_by=#{user_id}")
		end


		if !params[:search_string].nil?
			text = "%"+params[:search_string] + "%"
			data =data.where("sale_quotations.sale_quotation_no like  '#{text}' or customers.name like '#{text}' ")
		end
		result = data.select("sale_quotations.*" ,"id customer" ,"id lead")

		render  @@common.returnJoinPaginate(  data,result, params[:page],params[:limit])
	end
	def combo
		data = SaleQuotation.includes( :customer, :lead ).select("sale_quotations.*" ,"id customer" ,"id lead").where("status in('S','I')")
		text = params[:query]
		if !text.nil?
			data = data.where "sale_quotation_no like '%#{text}%' "
		end
		render json:{ data:data , success:true }

	end


	def get_item_detail
		data = []
		if !params[:quotation_id].nil?
			data = SaleQuotationDetail.joins(:ums ,:items).where( sale_quotation_id:params[:quotation_id]).select("
				sale_quotation_details.* ,ums.name um , items.name item_name , items.barcode , items.code , items.image_url image_url ")

		end

		render json:{ data:data , success:true }
	end

	def create

		SaleQuotation.transaction do
			user_id =  session[:user_id]
			data = SaleQuotation.new(permit_data_quotation)

			data.sale_quotation_no = @@common.get_code_with_config("QUOTATION" , params[:sale_quotation_no])
			data.created_by = user_id
			data.status = "D" # for status draft

			if data.valid?
				data.save
				render json:{ data:data , success:true }
			else
				render json:{ message:data.errors.full_messages.first, success:false}
				raise ActiveRecord::Rollback
			end
		end

	end


	def update
		SaleQuotation.transaction do

			data = SaleQuotation.find(params[:id])
			data.update_attributes(permit_data_quotation_edit)

			if data.valid?
				data.save
				render json:{ data:data , success:true}
			else
				render json:{ message:data.errors.full_messages.first, success:false}
				raise ActiveRecord::Rollback
			end

		end

	end
	# layout false
	def print_quotation

		if !params[:id].nil?

			@quotation = SaleQuotation.find(params[:id])
			@company  = CompanyProfile.find(1)
			@customer = @quotation.customer
			@sale = @quotation.sale_representative
			@quotation_detail = @quotation.sale_quotation_detail

		end
	end



	private
	def permit_data_quotation_edit
		params.permit(
			:id ,
			:sale_quotation_no,
			:customer_id,
			:lead_id ,
			:quotation_to,
			:date,
			:expire_date,
			:ref_no,
			:payment_term_id,
			:payment_term,
			:sale_representative_id,
			:note,
			:total_amount,
			:tax_percentag,
			:tax_amount,
			:grand_total_amount,
			:memo,
			:status,
			:created_by,
			:modify_by,
			:sale_quotation_detail_attributes=> [
				:id,
				:sale_quotation_id,
				:item_id,
				:description,
				:qty,
				:um_id,
				:total_qty,
				:price,
				:extent_price,
				:created_by,
				:modify_by,
				:_destroy
			]
		)

	end
	def permit_data_quotation
		params.permit(
			:sale_quotation_no,
			:customer_id,
			:lead_id ,
			:date,
			:quotation_to,
			:expire_date,
			:ref_no,
			:payment_term_id,
			:payment_term,
			:sale_representative_id,
			:note,
			:total_amount,
			:tax_percentag,
			:tax_amount,
			:grand_total_amount,
			:memo,
			:status,
			:created_by,
			:modify_by,
			:sale_quotation_detail_attributes=> [
				:sale_quotation_id,
				:item_id,
				:description,
				:qty,
				:um_id,
				:total_qty,
				:price,
				:extent_price,
				:created_by,
				:modify_by
			]
		)
	end

end
