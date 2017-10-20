class ContactController < ApplicationController
   @@common = Common.new
   def index
      data = Contact
      render @@common.returnPaginate(data, params[:page],params[:limit])
   end

   def combo
      data = Contact
      text = params[:query]
      if !text.nil?
         data =Contact.where "contact_name like '%#{text}%' "
      end
      render @@common.returnPaginate(data, params[:page],params[:limit])

   end
   def create
      @data = Contact.new permit_data
      @data.save
      render json:{ success:true , message:'Contact save success.'}
   end
   def update
      begin
         @data = Contact.find params[:id]
         @data.update_attributes(permit_data)
         render json:{ success:true , message:"Update Contact Success "}
      rescue Exception => e
         render json:{ success:false  , message:e.message}
      end
   end

   def destroy

   end

   private
   def permit_data
      params.permit(
         :id,
         :contact_name,
         :contact_mobile,
         :contact_id_card,
         :contact_email,
         :contact_address,
         :description
         )
   end
end
