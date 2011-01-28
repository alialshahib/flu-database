class HoboMigration39 < ActiveRecord::Migration
  def self.up
    remove_column :suseptibilities, :note
  end

  def self.down
    add_column :suseptibilities, :note, :text
  end
end
