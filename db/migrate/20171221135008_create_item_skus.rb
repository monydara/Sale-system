class CreateItemSkus < ActiveRecord::Migration[5.1]
  def change
    create_table :item_skus do |t|
        t.integer :item_id
        t.string :code
        t.decimal :price
        t.decimal :cost
      t.timestamps
    end
  end
end
