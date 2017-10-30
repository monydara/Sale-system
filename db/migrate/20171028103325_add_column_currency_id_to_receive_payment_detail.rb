class AddColumnCurrencyIdToReceivePaymentDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :receive_payment_details, :currency_id , :integer , after: :amount
  end
end
