class HoboMigration46 < ActiveRecord::Migration
  def self.up
    add_column :suseptibilities, :hospitalised, :boolean
    add_column :suseptibilities, :institution, :boolean
    add_column :suseptibilities, :community, :boolean
    add_column :suseptibilities, :other, :string
    add_column :suseptibilities, :not_known, :boolean
  end

  def self.down
    remove_column :suseptibilities, :hospitalised
    remove_column :suseptibilities, :institution
    remove_column :suseptibilities, :community
    remove_column :suseptibilities, :other
    remove_column :suseptibilities, :not_known
  end
end
