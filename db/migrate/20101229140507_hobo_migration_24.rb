class HoboMigration24 < ActiveRecord::Migration
  def self.up
    remove_column :suseptibilities, :title
  end

  def self.down
    add_column :suseptibilities, :title, :string
  end
end
