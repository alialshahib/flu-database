class HoboMigration22 < ActiveRecord::Migration
  def self.up
    add_column :ic50_datas, :title, :string
  end

  def self.down
    remove_column :ic50_datas, :title
  end
end
