class CustomPriceDetail < ActiveRecord::Base
  belongs_to :items , foreign_key:'item_id'
  belongs_to :custom_price , foreign_key:'custom_price_id'
  belongs_to :ums , foreign_key:'um_id'

end
