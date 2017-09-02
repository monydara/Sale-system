class CreateCustomPrices < ActiveRecord::Migration
  def change
    create_table :custom_prices do |t|
      t.string :name
      t.boolean :is_active
      t.string :description
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
