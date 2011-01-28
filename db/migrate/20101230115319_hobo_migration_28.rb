class HoboMigration28 < ActiveRecord::Migration
  def self.up
    remove_column :sequences, :title
  end

  def self.down
    add_column :sequences, :title, :string
  end
end
