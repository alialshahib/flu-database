class HoboMigration36 < ActiveRecord::Migration
  def self.up
    add_column :sequences, :body, :text
  end

  def self.down
    remove_column :sequences, :body
  end
end
