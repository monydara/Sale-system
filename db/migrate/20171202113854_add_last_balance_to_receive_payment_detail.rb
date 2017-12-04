class AddLastBalanceToReceivePaymentDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :receive_payment_details , :last_balance , :decimal
  end
end
