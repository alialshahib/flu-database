class HoboMigration40 < ActiveRecord::Migration
  def self.up
    remove_column :sequences, :body
  end

  def self.down
    add_column :sequences, :body, :text
  end
end
