class HoboMigration23 < ActiveRecord::Migration
  def self.up
    add_column :suseptibilities, :title, :string
  end

  def self.down
    remove_column :suseptibilities, :title
  end
end
