class CreateCustomPriceDetails < ActiveRecord::Migration
  def change
    create_table :custom_price_details do |t|
      t.integer :custom_price_id
      t.integer :item_id
      t.integer :um_id
      t.decimal :price
      t.decimal :extend_price
      t.timestamps
    end
  end
end
