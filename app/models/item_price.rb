class ItemPrice < ActiveRecord::Base
	belongs_to :ums , foreign_key:'um_id'

   belongs_to :item_sku , foreign_key:"item_id" , optional:true

   validates :um_id, presence: true
   validates :price, presence: true
   validates :multiplier, presence: true

   # accepts_nested_attributes_for :item_price , :allow_destroy => true
   validates_uniqueness_of :um_id , scope: :item_id , message:": Unit of Meassurement is already exist"

  def self.get_combo(item_sku_id)
    self.joins(:ums , :item_sku).where(item_id: item_sku_id).select("
          item_prices.id,
        item_prices.item_id,
        item_prices.um_id,
        item_prices.multiplier,
        item_prices.remark,
        ums.name 'um',
        item_skus.price
      ")
  end

end
