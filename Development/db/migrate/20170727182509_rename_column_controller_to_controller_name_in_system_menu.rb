class RenameColumnControllerToControllerNameInSystemMenu < ActiveRecord::Migration
  def up
    rename_column('sys_menus' , 'controller' , 'controller_name')
  end
end
