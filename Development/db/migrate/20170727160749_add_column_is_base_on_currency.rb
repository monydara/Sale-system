class AddColumnIsBaseOnCurrency < ActiveRecord::Migration
  def up

  	add_column("currencies", "is_base", :boolean, :after => "rate_out")

  end

  def down
  	remove_column("currencies", "is_base")
  end
end
