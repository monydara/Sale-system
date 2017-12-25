class ItemOptionValue < ApplicationRecord
  belongs_to :items , optional:true
  has_many :item_skus , foreign_key: "value_id"
end
