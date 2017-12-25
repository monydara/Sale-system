class BrandsController < ApplicationController
  @@common = Common.new
  def index
    data = Brand.order( created_at: "desc")
    if !params[:string].nil?
      text = "%"+params[:string]+"%"
      data = data.where(" description like '#{text}' or name like '#{text}'")
    end
    render @@common.returnPaginate(data, params[:page],params[:limit])
  end

  def combo
    data = Brand.all
    render json:{ data:data , success:true}
  end

  def create
    data = Brand.new(permit_data)
    data.save
    if data.valid?
      render json:{ data:data , success:true}
    else
      render json:{ error:data.errors, success:false}
    end

  end

  def update
    data = Brand.find(params[:id])
    data.update_attributes(permit_data)
    if data.valid?
      render json:{data:data, success:true}
    else
      render json:{error:data.errors, success:false}
    end
  end

  def destroy

  end

  private
  def permit_data
    params.permit(
        :name,
        :description
    )

  end
end
