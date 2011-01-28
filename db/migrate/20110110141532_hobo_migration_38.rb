class HoboMigration38 < ActiveRecord::Migration
  def self.up
    change_column :suseptibilities, :source_virus, :string, :limit => 255
  end

  def self.down
    change_column :suseptibilities, :source_virus, :boolean
  end
end
