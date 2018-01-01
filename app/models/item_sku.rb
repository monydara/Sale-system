class ItemSku < ApplicationRecord
  belongs_to :items ,foreign_key: 'item_id' ,optional:true
  has_many :item_sku_values , foreign_key: "sku_id"

  def self.get_description id
    item = self.joins(:items,:item_sku_values=>[ :item_option , :item_option_value] ).group("item_skus.id").select("
    items.name as 'item_name',
  group_concat(  item_options.option_name ,':',
 item_option_values.value_name ) as description ").find id

    " #{item.item_name } ( #{ item.description } )"
  end
end
