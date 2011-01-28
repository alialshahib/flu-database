class HoboMigration5 < ActiveRecord::Migration
  def self.up
    add_column :suseptibilities, :season, :string
    remove_column :suseptibilities, :country_id
    remove_column :suseptibilities, :season_id
  end

  def self.down
    remove_column :suseptibilities, :season
    add_column :suseptibilities, :country_id, :integer
    add_column :suseptibilities, :season_id, :string
  end
end
