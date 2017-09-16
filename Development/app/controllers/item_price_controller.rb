class ItemPriceController < ApplicationController
  def combo
    @data = []
    item_id = params[:item_id]
    unless item_id.nil?
      # ---- filter custom price by customer
      customer_id = params[:customer_id]
      if !customer_id.nil? && customer_id.to_i > 0
        @data = ItemPriceHelper.get_custom_price(item_id, customer_id)

      else
        @data = ItemPrice.joins(:ums).where(item_id: item_id).select(" item_prices.* , ums.name 'um' ")
      end

    end

    render json: { data: @data, success: true }
  end
end
