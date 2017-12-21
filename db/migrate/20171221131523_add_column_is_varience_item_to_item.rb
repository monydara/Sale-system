class AddColumnIsVarienceItemToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :is_variance , :boolean
  end
end
