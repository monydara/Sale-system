class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
        t.string :name
        t.string :symbol
        t.string :abbr
        t.decimal :fraction_unit
        t.decimal :rate_in , precision: 18, scale: 6
        t.decimal :rate_out , precision: 18, scale: 6
      t.timestamps
    end
  end
end
