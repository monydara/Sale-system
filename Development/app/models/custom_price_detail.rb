class CustomPriceDetail < ActiveRecord::Base
  belongs_to :custom_price , foreign_key:'custom_price_id'

end
