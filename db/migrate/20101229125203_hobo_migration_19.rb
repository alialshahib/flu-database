class HoboMigration19 < ActiveRecord::Migration
  def self.up
    add_column :ic50_datas, :title, :string
    add_column :ic50_datas, :country, :string
  end

  def self.down
    remove_column :ic50_datas, :title
    remove_column :ic50_datas, :country
  end
end
