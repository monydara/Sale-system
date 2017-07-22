class AddTableLeadFlag < ActiveRecord::Migration
  def up
    create_table :lead_flag do |t|
      t.string :name
      t.text :description
      t.timestamps
  	end
  end
  def down
  	drop_table :lead_flag
  end
end
