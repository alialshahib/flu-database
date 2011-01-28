class HoboMigration10 < ActiveRecord::Migration
  def self.up
    add_column :suseptibilities, :virus_type, :string
    add_column :suseptibilities, :source_virus, :binary
  end

  def self.down
    remove_column :suseptibilities, :virus_type
    remove_column :suseptibilities, :source_virus
  end
end
