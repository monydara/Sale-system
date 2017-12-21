class CreateItemOptionValues < ActiveRecord::Migration[5.1]
  def change
    create_table :item_option_values do |t|
        t.integer :item_id
        t.integer :option_id
        t.string :value_name
      t.timestamps
    end
  end
end
