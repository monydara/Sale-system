class ItemCategory < ActiveRecord::Base
	has_many :items, foreign_key: 'category_id'
end
