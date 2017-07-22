class AddColumnFlagToLead < ActiveRecord::Migration
  def up
  	
  	add_column("leads", "flag", :integer, :after => "lead_area_id")
  	add_column("leads", "source_id", :integer, :after => "source")
  	remove_column("leads", "source")
  end
  
  def down
  	remove_column("leads", "flag")
  end
end
