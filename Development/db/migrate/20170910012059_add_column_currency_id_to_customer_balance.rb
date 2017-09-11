class AddColumnCurrencyIdToCustomerBalance < ActiveRecord::Migration
  def up
    add_column 'customer_balances' , 'currency_id' , :integer , after: :balance
  end
end
