class HoboMigration8 < ActiveRecord::Migration
  def self.up
    add_column :countries, :name, :string
    remove_column :countries, :argentina
    remove_column :countries, :uruguay
    remove_column :countries, :brazil
    remove_column :countries, :peru
    remove_column :countries, :chile
    remove_column :countries, :colombia
  end

  def self.down
    remove_column :countries, :name
    add_column :countries, :argentina, :string
    add_column :countries, :uruguay, :string
    add_column :countries, :brazil, :string
    add_column :countries, :peru, :string
    add_column :countries, :chile, :string
    add_column :countries, :colombia, :string
  end
end
