class HoboMigration6 < ActiveRecord::Migration
  def self.up
    rename_column :suseptibilities, :title, :isolate_name
    rename_column :suseptibilities, :collection_date, :date_specimen_collected
    add_column :suseptibilities, :virus_sub_type, :string
    add_column :suseptibilities, :country, :string
  end

  def self.down
    rename_column :suseptibilities, :isolate_name, :title
    rename_column :suseptibilities, :date_specimen_collected, :collection_date
    remove_column :suseptibilities, :virus_sub_type
    remove_column :suseptibilities, :country
  end
end
