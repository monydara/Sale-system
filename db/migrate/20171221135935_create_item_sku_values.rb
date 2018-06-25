class CreateItemSkuValues < ActiveRecord::Migration[5.1]
  def change
    create_table :item_sku_values do |t|
        t.integer :item_id
        t.integer :sku_id
        t.integer :option_id
        t.integer :value_id
      t.timestamps
    end
  end
end
