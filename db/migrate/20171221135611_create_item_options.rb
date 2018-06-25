class CreateItemOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :item_options do |t|
        t.integer :item_id
        t.string :option_name
      t.timestamps
    end
  end
end
