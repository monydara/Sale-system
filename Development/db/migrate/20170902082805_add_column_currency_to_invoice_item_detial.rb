class AddColumnCurrencyToInvoiceItemDetial < ActiveRecord::Migration
  def up
    add_column :invoice_details , :currency_id , :integer , after: :extent_price
  end
end
