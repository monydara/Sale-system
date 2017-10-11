class SourcesController < ApplicationController
   def combo
      @data = Source.all
      render json:{ data:@data , success:true }
   end
end
