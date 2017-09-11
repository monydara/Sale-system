class SaleInvoiceController < ApplicationController
	@@common = Common.new

	def index
		model = Invoice.joins( :customer )
		data = model.select( " invoices.* ,
		 customers.name customer_name ,
		 invoices.grand_total_amount grand_total_amount_display ,
		 invoices.total_amount total_amount_display
		 ")


		if !params[:search_string].nil?
			text = "%"+params[:search_string] + "%"
			data =data.where("invoices.invoice_no like  '#{text}' or customers.name like '#{text}'  ")
		end

		render  @@common.returnJoinPaginate(  model, data, params[:page],params[:limit])
	end
	def combo
		data = Invoice.where(payment_flag:[1,2] , status:"S")
		render json:{ data:data , success:true}
	end

	def get_item_detail
		data = []
		if !params[:invoice_id].nil?
			data = InvoiceDetail.joins(:ums ,:items , :currency ).where( invoice_id:params[:invoice_id]).select("
				invoice_details.* ,ums.name um , items.name item_name , items.barcode , items.code  , currencies.symbol currency_symbol")

		end

		render json:{ data:data , success:true }
	end

	def create

		result = create_service()

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


					success= SaleInvoiceHelper.save_to_stock_transaction(data, session[:user_id] , session[:location_id] , session[:success], session[:message])
					success= SaleInvoiceHelper.customer_transaction(data, session[:user_id] )
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
	layout false
	def print_invoice
		if !params[:id].nil?

			@invoice = Invoice.find(params[:id])
			@company  = CompanyProfile.find(1)
			@customer = @invoice.customer
			@invoice_detail = @invoice.invoice_detail

			@quotation_no = ''

			quotation = @invoice.sale_quotation
			if !quotation.nil?
				@quotation_no = quotation.sale_quotation_no
			end

			@additional_row = ""

		# ====== add discount item
			if @invoice.discount_amount > 0
				@additional_row = "
					<tr class='none-border-bottom'>
						<td>
							Discount
						</td>
						<td></td>
						<td></td>
						<td>
							<div class='left'>
										$
							</div>
							<div class='right'>
								(#{ '%.02f' %  @invoice.discount_amount  })
							</div>
						</td>

					</tr>
				"

			end
		#  ========= add blank row
			$i = @invoice_detail.count()
			$num = 15

			until $i > $num  do
			   @additional_row =@additional_row + "<tr>
			   <td style='border-top:0px; border-bottom:0px'> &nbsp;</td>
			   <td style='border-top:0px; border-bottom:0px'> </td>
			   <td style='border-top:0px; border-bottom:0px'> </td>
			   <td style='border-top:0px; border-bottom:0px'> </td>
			   </tr>"
			   $i +=1;
			end

		end
	end



	private

	def create_service

		session[:success]= true
		session[:message] ="create success"
		data = []
		begin
			Invoice.transaction do

				data = Invoice.new(permit_data_invoice)

				if data.tax_percentag > 0
					data.invoice_no = @@common.get_code_with_config("INVOICE INCLUDE TAX" , params[:invoice_no])
				else
					data.invoice_no = @@common.get_code_with_config("INVOICE NOT INCLUDE TAX" , params[:invoice_no])

				end
				# check end of month date must be eirly
				if EomController.check_eom_date(data.date) == false
					session[:success] = false
					session[:message] = "<b> #{data.date} </b> is already closed.Date Avaliable after closed transaction only "

				# check code is exist . if exist will return error and message exist code in quotation
				elsif check_code_exist( data.invoice_no , data.tax_percentag ) == true

					session[:success] = false
					session[:message]="Invoice code already exist"

				else
					# input value by system
					data.created_by = session['user_id']
					data.location_id = session[:location_id]
					data.paid_amount = 0
					data.unpaid_amount = data.grand_total_amount
					data.payment_flag =1 # for flat not yet pay
					data.status = "S" # for status submit


					if data.valid?
						data.save
						# update quotation to invoie status
						if !data.sale_quotation_id.nil? && data.sale_quotation_id > 0
							data.sale_quotation.update_attributes(status:"I")
						end
						# process save to stock transaction
						session[:success]= SaleInvoiceHelper.save_to_stock_transaction(data, session[:user_id] , session[:location_id] , session[:success], session[:message])
						session[:success]= SaleInvoiceHelper.customer_transaction(data, session[:user_id] )

					else

						session[:success]=false
						session[:message]=data.errors.full_messages.first

					end
				end
				# rollback data change
				if session[:success] == false
					raise ActiveRecord::Rollback
				end
			end
		rescue Exception => e
			session[:success]=false
			session[:message]=e.message
			puts "===========ERROR : "+e.message
		end



		result = { data:data , success:session[:success] , message:session[:message] }

		return result
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
				:invoice_id,
				:item_id,
				:description,
				:serial,
				:qty,
				:um_id,
				:multiplier,
				:currency_id ,
				:total_qty,
				:dis_percentage,
				:price,
				:extent_price
			]
		)
	end
end
