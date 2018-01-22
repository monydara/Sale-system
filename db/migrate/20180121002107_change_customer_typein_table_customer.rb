class ChangeCustomerTypeinTableCustomer < ActiveRecord::Migration[5.1]
  def change
    remove_column :customers , :customer_type
    add_column :customers , :customer_type_id , :integer , after: :legal_name
  end
end
