class HoboMigration37 < ActiveRecord::Migration
  def self.up
    add_column :patients, :date_onset_of_illness, :date
    remove_column :patients, :age
  end

  def self.down
    remove_column :patients, :date_onset_of_illness
    add_column :patients, :age, :integer
  end
end
