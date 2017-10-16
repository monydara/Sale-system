class AddIsSaleReceiptToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :is_sale_receipt, :boolean

  end
end
