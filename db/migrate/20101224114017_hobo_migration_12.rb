class HoboMigration12 < ActiveRecord::Migration
  def self.up
    remove_column :suseptibilities, :virus_sub_type
    change_column :suseptibilities, :source_virus, :string, :limit => 255
  end

  def self.down
    add_column :suseptibilities, :virus_sub_type, :string
    change_column :suseptibilities, :source_virus, :binary
  end
end
