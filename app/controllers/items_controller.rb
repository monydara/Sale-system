class ItemsController < ApplicationController
  skip_before_action :authenticate, :only => [:upload_image]
  def initialize
    @@common = Common.new
    @@image_url = ''
  end


  def index
    data = Items.joins(:item_category, :item_type, :ums, :currency ).select("items.* , item_categories.name 'category_name' , '' item_options , '' item_option_values,
			item_types.name 'item_type_name', ums.name 'um_name', currencies.name 'currency_name' ")
    if !params[:search_string].nil?
      text = '%' + params[:search_string] + '%'
      data = data.where("items.name like '#{text}' or items.code like '#{text}' or items.barcode like '#{text}'")
    end
    render @@common.returnJoinPaginate(Items, data, params[:page], params[:limit])
  end

  def get_detail
    item_id = params[:item_id]
    data = []
    if !item_id.nil?
      data = ItemPrice.where item_id: item_id
    end
    render json: {data: data, success: true}
  end

  def get_sku
    item_id = params[:item_id]
    data = []
    if !item_id.nil?
      data = ItemSku.where item_id: item_id
    end
    render json: {data: data, success: true}
  end

  def comboFixedAsset
    data = Items.joins(:item_category, :ums).select("items.* , item_categories.name 'category_name' , ums.name 'um'")
    data = data.where("items.item_type_id='3'") ## Filter only item fixed asset (3=Fixed Asset)
    render json: {data: data, success: true}
  end

  def combo

    @customer_id = params[:customer_id]
    @data = nil

    if !@customer_id.nil? and @customer_id.to_i > 0 # filter customer price
      @data = ItemsHelper.get_item_by_custom_price(@customer_id, params[:query])

    else

      # ---- this is old combobox in old server ( no vairance item )
      # @data = Items.joins(:item_category, :ums, :currency ).select("items.* , item_categories.name 'category_name' , ums.name 'um' , currencies.symbol ")
      # text = params[:query]
      #
      # if !text.nil?
      #   @data = @data.where "items.name like '%#{text}%' or items.code like '%#{text}%' "
      # end

      @data = Items.combo params[:query]

    end

    render json: {data: @data, success: true}
  end

  def create
    Items.transaction do
      data = Items.new(permit_data)
      # generate code
      data.code = @@common.get_code_with_config("ITEM", params[:code])
      data.create_by = @current_user.id
      data.cost_avc = 0
      # insert um Price
      # @itemPrice = [{um_id: data.um_id.to_i, price: data.price, multiplier: 1.to_i}]


      # -- if not variance item it also insert item SKU by default
      if data.is_variance != true
        data.item_sku_attributes = [ { code: data.name , price: data.price , cost: data.cost_avc }]
      end

      # data.item_price_attributes =@itemPrice

      if data.valid?
        data.save
        # -- save item SKU

        Items.save_item_sku_value(data.id)

        @@image_url = ''
        render json: {data: data, success: true}
      else
        render json: {message: data.errors.full_messages.first, success: false}
        raise ActiveRecord::Rollback
      end
    end

  end

  def update

    data = Items.find(params[:id])
    data.modify_by =@current_user.id
    old_code = data.code
    data.update_attributes(permit_data)

    if data.valid?
      data.save()
      render json: {data: data, success: true}
    else
      render json: {message: data.errors.full_messages.first, success: false}

    end
  end

  def remove_image
    data = Items.find(params[:id])
    data.update_attributes(image_url: nil)
    render json: {data: data, success: true}
  end

  def destroy

  end

  def upload_image
    begin
      data =Image.new(permit_data_image)
      data.save
      @@image_url = data.image.url
      render json: {image_url: @@image_url, success: true}
    rescue Exception => e
      puts e
      render json: {errors: data.errors, success: false, messge: 'Image upload unsuccess'}

    end
  end

  private
  def check_code_exist(code)
    result = false
    item = Items.find_by code: code
    if !item.nil?
      result = true
    end
    return result
  end

  def permit_data_image
    params.permit(
        :image
    )
  end

  def permit_data
    params.permit(
        :name,
        :code,
        :barcode,
        :item_type_id,
        :category_id,
        :um_id,
        :price,
        :re_order_point,
        :is_use_serial,
        :image_url,
        :series_id,
        :model_id,
        :color,
        :depreciation_method_id,
        :depreciation_type_id,
        :depreciation_rate,
        :purchase_description,
        :sale_description,
        :currency_id,
        :memo,
        :status,
        :is_variance ,
        item_options_attributes: [
            :id,
            :option_name,
            item_option_values_attributes:[
              :id ,
              :value_name

            ]
        ],
        item_sku_attributes:[
          :id,
          :cost ,
          :id ,
          :price ,
          :code
        ]
    )
  end
end
