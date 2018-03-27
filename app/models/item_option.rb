class ItemOption < ApplicationRecord
  belongs_to :items , optional:true
  has_many :item_sku_values, foreign_key: "option_id"
	has_many :item_option_values , foreign_key: "option_id"
  accepts_nested_attributes_for :item_option_values ,:allow_destroy => true
end
