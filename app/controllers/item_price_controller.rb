class ItemPriceController < ApplicationController
  def combo
    @data = []
    item_sku_id = params[:item_id]
    unless item_sku_id.nil?
      # ---- filter custom price by customer
      customer_id = params[:customer_id]
      if !customer_id.nil? && customer_id.to_i > 0
        @data = ItemPriceHelper.get_custom_price(item_sku_id, customer_id)

      else
        item_sku = ItemSku.find item_sku_id
        @data =ItemPrice.get_combo item_sku_id

      end

    end

    render json: { data: @data, success: true }
  end
end
