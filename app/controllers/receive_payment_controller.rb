class ReceivePaymentController < ApplicationController

	def check_payment
		begin
			invoice_id = params[:invoice_id]

			if !invoice_id.nil?
				data = ReceivePaymentDetail.where(invoice_id:invoice_id) 
				render json:{ dataCount:data.count() , success:true , message:'Get Data Success'}				
			else
				render json:{ success:false , message:"Can't load data with invoice id nil"}	
			end


		rescue Exception => e
			puts "========ERROR: "+e.message
			render json:{ success:false , message:e.message }
		end
		
	end
end
