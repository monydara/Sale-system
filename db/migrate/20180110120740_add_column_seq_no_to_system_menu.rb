class AddColumnSeqNoToSystemMenu < ActiveRecord::Migration[5.1]
  def change
    add_column :sys_menus , :seq_no , :integer , after: :controller_name
  end
end
