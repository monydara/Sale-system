class ReportItemController < ApplicationController
  skip_before_action :authenticate, :only => [:show]
  def initialize
    @common = Common.new
    @validate = Util::Validate.new
  end
  def index
    get_data
    render @common.returnJoinPaginate(  @model, @data, params[:page],params[:limit])
  end

  def show
    # @data = get_data
    render 'test.html'
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
    if @validate.isNotBlank p[:category_id]
      @model = @model.where "category_id =#{ p[:category_id] }"
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
      :column,
      :category_id
      )
  end
end
