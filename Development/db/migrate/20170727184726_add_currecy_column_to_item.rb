class AddCurrecyColumnToItem < ActiveRecord::Migration
  def up
    add_column('items' , 'currency_id' , :integer, :after => 'price')
  end
end
