class AddBrandIdToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items , :brand_id , :integer
  end
end
