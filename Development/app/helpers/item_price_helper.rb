module ItemPriceHelper
  def self.get_custom_price(item_id, customer_id)

    @data = nil

    @customer  = Customer.find(customer_id)
    if @customer.custom_price_id > 0

      # --- join with  custom price item detail

      @data = get_custom_price_by_sql(  @customer.custom_price_id , item_id)

    end

    return @data

  end
  private
  def self.get_custom_price_by_sql custom_price_id , item_id
    ItemPrice.find_by_sql("
      select
      itp.id,
      itp.item_id,
      itp.um_id,
      itp.multiplier,
      case when cpd.extend_price is not null
      then cpd.extend_price else itp.price end  price,
      itp.remark,
      um.name 'um'

      from item_prices itp

      left join ums um on um.id = itp.um_id
      left join custom_price_details cpd on cpd.item_id = itp.item_id and cpd.um_id = itp.um_id and cpd.custom_price_id = #{custom_price_id}
      where itp.item_id = #{item_id}
  ")
  end
end
