class HoboMigration15 < ActiveRecord::Migration
  def self.up
    rename_column :ic50_datas, :iC50_zanamivir_munana_nm, :iC50_zanamivir_MUNANA_nm
  end

  def self.down
    rename_column :ic50_datas, :iC50_zanamivir_MUNANA_nm, :iC50_zanamivir_munana_nm
  end
end
