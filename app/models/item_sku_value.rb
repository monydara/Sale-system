class ItemSkuValue < ApplicationRecord
  belongs_to :items , optional:true
  belongs_to :item_sku , optional:true
  belongs_to :item_option , foreign_key: 'option_id' ,optional:true
  belongs_to :item_option_value ,foreign_key:'value_id', optional:true
end
