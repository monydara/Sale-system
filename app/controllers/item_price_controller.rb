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
        @data = ItemPrice.joins(:ums).where(item_id: item_sku.item_id).select("
          item_prices.id,
        item_prices.item_id,
        item_prices.um_id,
        item_prices.multiplier,
        item_prices.remark,
        ums.name 'um'
      ")
      end

    end

    render json: { data: @data, success: true }
  end
end
