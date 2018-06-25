class LookupsController < ApplicationController

   def get_lead_status
      @data = LookUp.where cod_type:"LEAD STATUS"
      render json:{ success:true , data:@data}
   end
end
