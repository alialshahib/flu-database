class HoboMigration2 < ActiveRecord::Migration
  def self.up
    change_column :patients, :gender, :string, :limit => 255
  end

  def self.down
    change_column :patients, :gender, :boolean
  end
end
