class HoboMigration13 < ActiveRecord::Migration
  def self.up
    create_table :ic50_datas do |t|
      t.string   :ic50_zanamivir_munana_nm
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :ic50_datas
  end
end
