module ItemsHelper


  def self.get_item_by_custom_price customer_id , qeuryString

    # get customer price id
    data = nil
    customer  = Customer.find(customer_id)
    if customer.custom_price_id > 0

      # --- join with  custom price item detail

      data = get_item_price_data(  customer.custom_price_id , qeuryString)

    end

    return data
  end

  private
  # -- get item price base on cutomer id
  def self.get_item_price_data custom_price_id , query

    Items.find_by_sql("
        select
        itm.id ,
        itm.name ,
        itm.barcode ,
        itm.item_type_id ,
        itm.category_id ,
        itm.um_id ,
        case when cpd.extend_price is not null
        then cpd.extend_price+'' else itm.price end  price ,
        itm.currency_id ,
        itm.code,
          itm.cost_avc,
          itm.is_use_serial,
          itm.re_order_point ,
          itm.image_url,
          itm.series_id,
           itm.color,
          itm.model_id,
          itm.depreciation_method_id,
          itm.depreciation_type_id,
          itm.depreciation_rate,
          itm.memo,
          itm.sale_description,
         itm.purchase_description,
          itm.status,
          -- other column
           itc.name 'category_name' ,
           um.name 'um' ,
           crn.symbol

         from items itm
        left join custom_price_details cpd on cpd.item_id = itm.id and itm.um_id = cpd.um_id  and cpd.custom_price_id = #{custom_price_id}
        inner join item_categories itc  on itc.id = itm.category_id
        inner join ums um on um.id = itm.um_id
        inner join currencies crn on crn.id = itm.currency_id
        where itm.name like '%#{ query }%' or itm.code like '%#{ query }%' ")


  end
end
