class HoboMigration32 < ActiveRecord::Migration
  def self.up
    add_column :suseptibilities, :note, :text
    remove_column :suseptibilities, :ali
  end

  def self.down
    remove_column :suseptibilities, :note
    add_column :suseptibilities, :ali, :text
  end
end
