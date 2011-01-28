class HoboMigration1 < ActiveRecord::Migration
  def self.up
    add_column :patients, :vaccinated, :boolean
    change_column :patients, :title, :string, :limit => 255
    change_column :patients, :gender, :boolean
    change_column :patients, :location, :string, :limit => 255
  end

  def self.down
    remove_column :patients, :vaccinated
    change_column :patients, :title, :text
    change_column :patients, :gender, :text
    change_column :patients, :location, :integer
  end
end
