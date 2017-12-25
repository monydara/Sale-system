class ItemSku < ApplicationRecord
  belongs_to :items , optional:true
  has_many :item_sku_values , foreign_key: "sku_id"
end
