class HoboMigration31 < ActiveRecord::Migration
  def self.up
    add_column :suseptibilities, :ali, :text
  end

  def self.down
    remove_column :suseptibilities, :ali
  end
end
