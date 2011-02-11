class AddYearToSeason < ActiveRecord::Migration
  def self.up
    add_column :seasons, :year, :integer
    remove_column :seasons, :name
  end

  def self.down
    remove_column :seasons, :year
    add_column :seasons, :name, :string
  end
end
