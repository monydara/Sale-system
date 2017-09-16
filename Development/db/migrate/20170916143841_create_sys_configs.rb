class CreateSysConfigs < ActiveRecord::Migration
  def change
    create_table :sys_configs do |t|
        t.string :code
        t.string :name
        t.text :description
        t.string :data_type
        t.string :value
        t.string :configs_type

      t.timestamps
    end
  end
end
