class CustomPrice < ActiveRecord::Base
  has_many :custom_price_detail , foreign_key:'custom_price_id'
  accepts_nested_attributes_for :custom_price_detail , :allow_destroy => true
end
