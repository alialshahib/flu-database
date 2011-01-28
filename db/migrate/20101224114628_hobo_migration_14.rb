class HoboMigration14 < ActiveRecord::Migration
  def self.up
    rename_column :ic50_datas, :ic50_zanamivir_munana_nm, :iC50_zanamivir_munana_nm
  end

  def self.down
    rename_column :ic50_datas, :iC50_zanamivir_munana_nm, :ic50_zanamivir_munana_nm
  end
end
