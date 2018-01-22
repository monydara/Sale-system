class CustomerTypesController < ApplicationController
  def combo
    @data =CustomerType.all
    render json:{ data:@data , success:true}
    #code
  end
end
