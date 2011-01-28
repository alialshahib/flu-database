class HoboMigration30 < ActiveRecord::Migration
  def self.up
    change_column :suseptibilities, :source_virus, :boolean, :limit => nil
  end

  def self.down
    change_column :suseptibilities, :source_virus, :string
  end
end
