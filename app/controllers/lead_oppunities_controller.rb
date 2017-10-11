class LeadOppunitiesController < ApplicationController
   @@common = Common.new
   def index
      user_id =  session[:user_id]
      data = LeadOpportunity.joins(:look_up  ).joins("
            left join leads on leads.id = lead_opportunities.lead_id
            left join customers on customers.id = lead_opportunities.customer_id
            left join sale_representatives on sale_representatives.id = lead_opportunities.next_contact_by
         ").where("lead_opportunities.created_by=#{user_id}")
      result =data.select("lead_opportunities.* ,
         look_ups.name status_name ,
         case
            when leads.id is null then
               customers.name
            else
               leads.name
            end
         customer_name,
         concat(sale_representatives.first_name,' ', sale_representatives.last_name) next_contact_by_name
         ")
      render @@common.returnJoinPaginate(data, result, params[:page],params[:limit])
   end
   def get_detail
      @data = LeadOpportunityDetail.where oppunity_id:params[:opportunity_id]
      render json:{ data:@data , success:true }
   end
   def combo

      data =LookUp.where cod_type:'OPPORTUNITY TYPE'

      render json:{ data:data , success:true}

   end
   def create
      begin
         user_id =  session[:user_id]
         @data = LeadOpportunity.new(permit_data)
         @data.code = @@common.get_code_with_config("OPPORTUNITY " , params[:code])
         if @data.valid?
            @data.created_by=user_id
            @data.save
            render json:{ success:true , message:'LeadOpportunity save success.'}
         else
            render json:{ success:false , message:@data.errors.full_messages.first}
         end
      rescue Exception => e
         puts e.backtrace
         render json:{success:false, message:e.message }
      end

   end
   def update
      begin
         user_id =  session[:user_id]
         @data = LeadOpportunity.find params[:id]
         @data.update_attributes(permit_data)
         @data.update(modified_by:user_id)
         render json:{ success:true , message:"Update LeadOpportunity Success "}
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
         :code,
         :oppunity_type,
         :oppunity_to,
         :status_id,
         :customer_id,
         :lead_id,
         :contact_id,
         :source_id,
         :next_contact_by,
         :next_contact_date,
         :to_discuss,
         :is_with_item,
         lead_opportunity_detail_attributes:[
            :id,
            :item_id,
            :um_id,
            :qty
         ]

         )
   end

end
