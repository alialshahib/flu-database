class HoboMigration29 < ActiveRecord::Migration
  def self.up
    add_column :sequences, :title, :string
  end

  def self.down
    remove_column :sequences, :title
  end
end
