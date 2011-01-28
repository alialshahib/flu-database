class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :patients, :age, :integer
  end

  def self.down
    remove_column :patients, :age
  end
end
