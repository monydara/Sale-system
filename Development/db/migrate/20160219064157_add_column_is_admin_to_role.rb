class AddColumnIsAdminToRole < ActiveRecord::Migration
  def up
  	add_column("roles", "is_admin", :boolean, :after => "is_active")
  	
  end

  def down
  	remove_column("roles", "is_admin")

  end
end
