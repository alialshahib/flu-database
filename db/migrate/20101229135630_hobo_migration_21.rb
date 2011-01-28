class HoboMigration21 < ActiveRecord::Migration
  def self.up
    remove_column :ic50_datas, :title
  end

  def self.down
    add_column :ic50_datas, :title, :string
  end
end
