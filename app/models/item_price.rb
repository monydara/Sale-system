class ItemPrice < ActiveRecord::Base
	belongs_to :ums , foreign_key:'um_id'
   has_many :item_price , foreign_key:"item_id"

   validates :um_id, presence: true
   validates :price, presence: true
   validates :multiplier, presence: true

   accepts_nested_attributes_for :item_price , :allow_destroy => true
   validates_uniqueness_of :um_id , scope: :item_id , message:": Unit of Meassurement is already exist"

end
