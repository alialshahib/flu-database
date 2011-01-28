class HoboMigration20 < ActiveRecord::Migration
  def self.up
    remove_column :ic50_datas, :country
  end

  def self.down
    add_column :ic50_datas, :country, :string
  end
end
