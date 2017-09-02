class AddColumnCustomPriceToCustomer < ActiveRecord::Migration
  def up
    add_column 'customers' , 'custom_price_id' , :integer , after: :customer_area_id
  end
  def down
    remove_column 'customers' , 'custom_prices_id'
  end
end
