class AddDiscountToInvoiceDetail < ActiveRecord::Migration
  def up
    add_column 'invoice_details' , 'dis_percentage' , :decimal , after: :item_id
    add_column 'invoice_details' , 'dis_amount' , :decimal , after: :item_id
  end
end
