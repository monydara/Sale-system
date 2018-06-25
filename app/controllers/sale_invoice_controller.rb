class SaleInvoiceController < ApplicationController
	def initialize
		@@common = Common.new
	end


	def index
		model = Invoice.joins( :customer ).where is_sale_receipt:false
		data = model.select( " invoices.* ,
		 customers.name customer_name ,
		 invoices.grand_total_amount grand_total_amount_display ,
		 invoices.total_amount total_amount_display
		 ").order(date: "desc")


		if !params[:search_string].nil?
			text = "%"+params[:search_string] + "%"
			data =data.where("invoices.invoice_no like  '#{text}' or customers.name like '#{text}'  ")
		end

		render  @@common.returnJoinPaginate(  model, data, params[:page],params[:limit])
	end
	def combo
		data = Invoice.where(status:"S")
		  @validate = Util::Validate.new
			if @validate.isNotBlank params[:query]
				data = data.where "invoice_no like '%#{params[:query]}%'"
			end


		render json:{ data:data , success:true}
	end

	def get_item_detail
		data = []
		if !params[:invoice_id].nil?
			data = InvoiceDetail.joins(:ums ,item_sku:[items:[:currency]]).where( invoice_id:params[:invoice_id]).select("
				invoice_details.* ,ums.name um , items.barcode , item_skus.code  as item_name , currencies.symbol currency_symbol")

		end

		render json:{ data:data , success:true }
	end

	def create
		data = Invoice.new(permit_data_invoice)
		result = create_service false , params  , data , 1 , @current_user.id

		render json:result

	end

	def update
		begin

			Invoice.transaction do
				success = true

				data = Invoice.find(params[:id])
				old_code = data.invoice_no
				if old_code.to_s != params[:invoice_no].to_s

					# check code is exist . if exist will return error and message exist code in invoice
					if check_code_exist( params[:invoice_no].to_s , data.tax_percentag) == true
							render json:{ message:"Invoice code already exist" , success:false}
						return 0

					end

				end

				SaleInvoiceHelper.remove_item_transaction(data)

				data.update_attributes(permit_data_invoice_edit)

				if data.valid?


					success= SaleInvoiceHelper.save_to_stock_transaction(data, @current_user.id , session[:location_id] , session[:success], session[:message])
					success= SaleInvoiceHelper.customer_transaction(data, @current_user.id  , false )
					render json:{ data:data , success:success}
				else
					render json:{ data:data , success:false, error:data.errors }
				end

			end
		rescue Exception => e
			puts "========ERROR: "+e.message
			render json:{ success:false , message:e.message}

		end


	end

	def void
		begin
			id = params[:id]
			if !id.nil?
				data = Invoice.find(id)
				data.update_attributes(status:"V")
				SaleInvoiceHelper.remove_item_transaction(data)

				render json:{ success:true, data:data }
			else
				render json:{ success:false , message:'Can not remove without id', }
			end
		rescue Exception => e
			render json:{ success:false, message:"Void not success, have problem on sever", error:e.message}
		end
	end
	# layout false





	def create_service is_sale_reciept , p_data , data , location_id , user_id

		success= true
		message="create success"


			Invoice.transaction do


				data.invoice_no = get_invoice_code is_sale_reciept , data.tax_percentag , p_data[:invoice_no]


				# check end of month date must be eirly
				if EomController.check_eom_date(data.date) == false
					success = false
					message = "<b> #{data.date} </b> is already closed.Date Avaliable after closed transaction only "

				# check code is exist . if exist will return error and message exist code in quotation
				elsif check_code_exist( data.invoice_no , data.tax_percentag ) == true

					success = false
					message="Invoice code already exist"

				else
					# input value by system
					data.created_by = user_id
					data.location_id = location_id
					data.paid_amount = 0
					data.unpaid_amount = data.grand_total_amount
					data.payment_flag =1 # for flat not yet pay
					data.status = "S" # for status submit
					data.is_sale_receipt = is_sale_reciept
					# data.invoice_detail_attributes = params[:invoice_detail_attributes]

					puts "------ 1"

					puts "invoie detail #{data.invoice_detail.count}"
					puts "invoice detail natse #{ p_data[:invoice_detail_attributes] }"

					if data.valid?
						data.save
						puts "------ 2"
						# update quotation to invoie status
						if !data.sale_quotation_id.nil? && data.sale_quotation_id > 0
							data.sale_quotation.update_attributes(status:"I")
						end
						# process save to stock transaction
						success= SaleInvoiceHelper.save_to_stock_transaction(data, user_id , location_id , success, message)
						# process save to customer transaction
						success= SaleInvoiceHelper.customer_transaction(data, user_id, is_sale_reciept  )

					else

						success=false
						message=data.errors.full_messages.first

					end
				end
				# rollback data change
				if success == false
					raise ActiveRecord::Rollback
				end
			end
			result = { data:data , success:success , message:message }

		return result
	end

private
	def get_invoice_code is_sale_receipt , tax , inv_code

		# --- filter if function calll by sale receipt will return code as sale receipt

		code_name = ""
		if tax > 0
			code_name = is_sale_receipt ? "SALE RECEIPT INCLUDE TAX" :  "INVOICE INCLUDE TAX"

		else
			code_name = is_sale_receipt ? "SALE RECEIPT NOT INCLUDE TAX" :  "INVOICE NOT INCLUDE TAX"
		end



		@@common.get_code_with_config(code_name  , inv_code)
	end
	def check_code_exist( code, tax_percentag )
		result = false
		if tax_percentag > 0
			data = Invoice.where(" invoice_no = '#{code}' and tax_percentag > 0 ")
		else
			data =Invoice.where(" invoice_no = '#{code}' and (tax_percentag = 0 or tax_percentag is null )")
		end

		if data.count > 0
			result= true # code already exist
		end

		return result

	end
	def permit_data_invoice_edit
		params.permit(
			:id ,
			:invoice_no,
			:sale_quotation_id,
			:location_id,
			:customer_id ,
			:date,
			:due_date,
			:ref_no,
			:total_amount,
			:discount_percentag,
			:discount_amount,
			:tax_percentag,
			:tax_amount,
			:grand_total_amount,
			:memo,
			:status ,
			:invoice_detail_attributes=> [
				:id ,
				:invoice_id,
				:item_id,
				:description,
				:serial,
				:qty,
				:currency_id ,
				:um_id,
				:multiplier,
				:total_qty,
				:price,
				:extent_price,
				:dis_amount,
				:dis_percentage,
				:_destroy
			]
		)

	end
	def permit_data_invoice
		params.permit(
			:invoice_no,
			:sale_quotation_id,
			:location_id,
			:customer_id,
			:date,
			:due_date,
			:ref_no,
			:total_amount,
			:discount_percentag,
			:discount_amount,
			:tax_percentag,
			:tax_amount,
			:grand_total_amount,
			:memo,
			:invoice_detail_attributes=> [
				:item_id,
				:description,
				:serial,
				:qty,
				:um_id,
				:multiplier,
				:currency_id ,
				:total_qty,
				:dis_amount,
				:dis_percentage,
				:price,
				:extent_price
			]
		)
	end
end
