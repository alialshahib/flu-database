class HoboMigration35 < ActiveRecord::Migration
  def self.up
    remove_column :ic50_datas, :key_timestamp
    remove_column :ic50_datas, :lifecycle_state

    remove_index :ic50_datas, :name => :index_ic50_datas_on_lifecycle_state rescue ActiveRecord::StatementInvalid
  end

  def self.down
    add_column :ic50_datas, :key_timestamp, :datetime
    add_column :ic50_datas, :lifecycle_state, :string, :default => "not_published"

    add_index :ic50_datas, [:lifecycle_state]
  end
end
