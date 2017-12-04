class CustomerPaymentController < ApplicationController
	@@common = Common.new
	def index
		data = ReceivePayment
		if !params[:string].nil?
			text = "%"+params[:string]+"%"
			data = data.where(" code like '#{text}' or name like '#{text}'")
		end
		data = data.joins(:customer)
		result = data.select("receive_payments.* , customers.name customer_name").order(created_at:'desc')
		render @@common.returnJoinPaginate(data, result, params[:page],params[:limit])
	end

	def combo
		data = ReceivePayment.all
		render json:{ data:data , success:true}
	end

	def create
		begin
			ReceivePayment.transaction do
				data = ReceivePayment.new(permit_data)
				data.created_by = @current_user.id
				data.grand_total_amount =data.total_amount
				# === get code
				data.receipt_no = CustomerPaymentHelper.get_code(data)

					#=== remvoe detail with amount 0
				data.receive_payment_detail.each do |d|
					if d.amount ==0
						data.receive_payment_detail.delete d
					end
				end

				# check code exist
				if EomController.check_eom_date(data.date) == false

					render json:{ success:false , message:"<b> #{data.date} </b> is already closed.Date Avaliable after closed transaction only "}
					raise ActiveRecord::Rollback
				elsif CustomerPaymentHelper.check_code_exist(data) == true
					render json:{ success:false , message:"Receipt No. <b>#{data.receipt_no}</b> already exist"}
					raise ActiveRecord::Rollback
				else
					# === update unpaid amount and status

					success = CustomerPaymentHelper.payment_invoice(data , @current_user.id )


					if data.valid? && success == true
						data.save
						success = CustomerPaymentHelper.insert_to_customer_transaction(data, @current_user.id )
						render json:{ data:data , success:true}
					else
						render json:{ message:"Process payment Fail ; message:#{data.errors.messages}" , success:false}
						raise ActiveRecord::Rollback

					end
				end


			end
		rescue Exception => e
			puts "============= EROR:"+e.message
			render json:{ message:e.message, success:false}

		end

	end

	def update
		begin
			ReceivePayment.transaction do
				data = ReceivePayment.find(params[:id])
				data.modify_by = @current_user.id

				# check code exist
				if EomController.check_eom_date(data.date) == false

					render @@common.return_fail("<b> #{data.date} </b> is already closed.Date Avaliable after closed transaction only")
					raise ActiveRecord::Rollback
					return
				else
					# === roll back last invoice paid

					if CustomerPaymentHelper.roll_back_invoice(data , @current_user.id ) == false
						render @@common.return_fail("data can not rollback invoice paid")
						raise ActiveRecord::Rollback
						return
					end

					data.update_attributes(permit_data_edit)
					data.update_attributes(grand_total_amount:data.total_amount)

					# ======  update customer transaction
					if CustomerPaymentHelper.update_customer_transaction(data , @current_user.id ) == false
						render @@common.return_fail("data can not update customer transaction")
						raise ActiveRecord::Rollback
						return
					end
					# ==== make payment_invoice
					if CustomerPaymentHelper.payment_invoice(data , @current_user.id )	== false
						render @@common.return_fail("data can not make payment invoice")
						raise ActiveRecord::Rollback
						return
					end

					if data.valid?
						render @@common.return_success(data)
					else
						render @@common.return_fail("data process payment fail")
						raise ActiveRecord::Rollback

					end
				end


			end
		rescue Exception => e
			puts "============= EROR:"+e.message
			render json:{ message:e.message, success:false}
		end

	end

	def destroy

	end
	# layout false
	def print
		if !params[:id].nil?

			@recieve_payment = ReceivePayment.find(params[:id])
			@company  = CompanyProfile.find(1)
			@customer = @recieve_payment.customer
			@recieve_payment_detail = @recieve_payment.receive_payment_detail

			@is_include_tax = CustomerPaymentHelper.check_receipt_is_include_tax(@recieve_payment)



			@additional_row = ""


			$i = @recieve_payment_detail.count()
			$num = 10

			until $i > $num  do
			   @additional_row =@additional_row + "<tr>
			   <td style='border-top:0px; border-bottom:0px'> &nbsp;</td>
			   <td style='border-top:0px; border-bottom:0px'> &nbsp;</td>
			   <td style='border-top:0px; border-bottom:0px' colspan='2'> &nbsp;</td>
			   <td style='border-top:0px; border-bottom:0px'> </td>
			   </tr>"
			   $i +=1;
			end

		end
	end



# ============ additional function
	def get_item_detail
		begin
			data = []
			# == filter invoice by customer cusotmer
			if !params[:customer_id].nil?
				data = CustomerPaymentHelper.get_invioce_detail(params[:customer_id])

				# --- filter papyment detail by receipt
				elsif !params[:payment_id].nil?
				data = ReceivePaymentDetail.joins( :invoice).select("
					receive_payment_details.id ,
					invoices.id as invoice_id,
					invoices.grand_total_amount as invoice_amount,
					invoices.unpaid_amount+ receive_payment_details.amount unpaid_amount,
					invoices.paid_amount-receive_payment_details.amount paid_amount,
					invoices.invoice_no ,
					receive_payment_details.amount amount,
					invoices.unpaid_amount balance
					").where(receive_payment_id:params[:payment_id])
			end
			render json:{ data:data , success:true }
		rescue Exception => e
			render json:{ message:e.message , success:false}
		end

	end

	private
	def permit_data
		params.permit(
			:receipt_no,
			:customer_id,
			:date,
			:payment_type,
			:ref_no,
			:total_amount,
			:discount_percentag,
			:discount_amount,
			:grand_total_amount,
			:memo,
			:receive_payment_detail_attributes=> [
				:receive_payment_id,
				:invoice_id,
				:currency_id,
				:amount,
				:description,
				:last_balance,
				:_destroy
			]
			)

	end
	def permit_data_edit
		params.permit(
			:id,
			:receipt_no,
			:customer_id,
			:date,
			:payment_type,
			:ref_no,
			:total_amount,
			:discount_percentag,
			:discount_amount,
			:grand_total_amount,
			:memo,
			:receive_payment_detail_attributes=> [
				:id,
				:receive_payment_id,
				:invoice_id,
				:amount,
				:description,
				:last_balance,
				:_destroy
			]
			)

	end
end
