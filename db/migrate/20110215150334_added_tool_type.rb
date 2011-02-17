class AddedToolType < ActiveRecord::Migration
  def self.up
    add_column :tools, :tooltype, :string
  end

  def self.down
    remove_column :tools, :tooltype
  end
end
