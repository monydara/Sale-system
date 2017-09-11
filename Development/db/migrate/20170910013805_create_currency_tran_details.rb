class CreateCurrencyTranDetails < ActiveRecord::Migration
  def change
    create_table :currency_tran_details do |t|
        t.string :ref_type
        t.integer :ref_id
        t.integer :currency_id
        t.decimal :sub_total , precision: 18, scale: 6
        t.decimal :dis_percentage ,precision: 18, scale: 6
        t.decimal :dis_amount, precision: 18, scale: 6
        t.decimal :tax_amount , precision: 18, scale: 6
        t.decimal :grad_total,precision: 18, scale: 6

      t.timestamps
    end
  end
end
