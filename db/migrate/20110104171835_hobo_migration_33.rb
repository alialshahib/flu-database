class HoboMigration33 < ActiveRecord::Migration
  def self.up
    add_column :ic50_datas, :lifecycle_state, :string, :default => "not_published"
    add_column :ic50_datas, :key_timestamp, :datetime

    add_index :ic50_datas, [:lifecycle_state]
  end

  def self.down
    remove_column :ic50_datas, :lifecycle_state
    remove_column :ic50_datas, :key_timestamp

    remove_index :ic50_datas, :name => :index_ic50_datas_on_lifecycle_state rescue ActiveRecord::StatementInvalid
  end
end
