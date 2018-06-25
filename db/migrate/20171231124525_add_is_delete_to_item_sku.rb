class AddIsDeleteToItemSku < ActiveRecord::Migration[5.1]
  def change
    add_column :item_skus , :is_delete , :boolean

  end
end
