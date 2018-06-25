class ItemType < ActiveRecord::Base
	has_many :item_type, foreign_key: 'item_type_id'
end
