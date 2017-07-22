class PaymentTermsController < ApplicationController
   @@common = Common.new
   def index
      data = PaymentTerm.all

      render @@common.returnPaginate(data, params[:page],params[:limit])
   end

   def combo
      data = PaymentTerm.all
      render json:{ data:data , success:true}
   end

   def create
      data = PaymentTerm.new(permit_data)
      if data.valid?
         data.save
         render json:{ data:data , success:true}
      else
         render json:{ message:data.errors.full_messages.first, success:false}

      end

   end

   def update
      data = PaymentTerm.find(params[:id])
      data.update_attributes(permit_data)
      if data.valid?
         data.save
         render json:{data:data, success:true}
      else
         render json:{ message:data.errors.full_messages.first, success:false}
      end
   end

   def destroy

   end

   private
   def permit_data
      params.permit(
         :payment_term_name,
         :payment_term_description,
         :is_active
         )

   end


end
