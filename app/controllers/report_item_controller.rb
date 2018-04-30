class ReportItemController < ApplicationController
  def initialize
    @common = Common.new
    @validate = Util::Validate.new
  end
  def index
    get_data
    render @common.returnJoinPaginate(  @model, @data, params[:page],params[:limit])
  end

  def print
    @data = get_data
  end
  def get_data
  #code

  # --- query table
  @model = ItemSku.joins(items:[:item_category , :ums , :currency])

    # ----- parameter
    p = permit_data()

    # --- filter
    if @validate.isNotBlank p[:item_id]
      @model=  @model.where "item_id =#{p[:item_id]}"
    end

    @data = @model.select("item_skus.* , items.name ,
      ums.name um_name  ,
      item_categories.name category_name,
      items.is_variance
      ")


  end
  def permit_data
    params.permit(

      :item_id,
      :column
      )
  end
end
