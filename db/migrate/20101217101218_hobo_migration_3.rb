class HoboMigration3 < ActiveRecord::Migration
  def self.up
    change_column :sequences, :gene, :string, :limit => 255
    change_column :sequences, :accession, :string, :limit => 255

    change_column :suseptibilities, :title, :string, :limit => 255
    change_column :suseptibilities, :season_id, :string, :limit => 255
  end

  def self.down
    change_column :sequences, :gene, :integer
    change_column :sequences, :accession, :text

    change_column :suseptibilities, :title, :text
    change_column :suseptibilities, :season_id, :text
  end
end
