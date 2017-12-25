class ItemSkuValue < ApplicationRecord
  belongs_to :items , optional:true
  belongs_to :item_sku , optional:true
  belongs_to :item_option , optional:true
  belongs_to :item_option_value , optional:true
end
