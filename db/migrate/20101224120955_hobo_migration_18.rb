class HoboMigration18 < ActiveRecord::Migration
  def self.up
    change_column :ic50_datas, :iC50_oseltamivir_munana_nm, :decimal
    change_column :ic50_datas, :iC50_zanamivir_other_nm, :decimal
    change_column :ic50_datas, :iC50_zanamivir_na_star_nm, :decimal
    change_column :ic50_datas, :iC50_amantadine_um, :decimal
    change_column :ic50_datas, :iC50_zanamivir_MUNANA_nm, :decimal
    change_column :ic50_datas, :iC50_oseltamivir_other_nm, :decimal
    change_column :ic50_datas, :iC50_oseltamivir_na_star_nm, :decimal
    change_column :ic50_datas, :iC50_rimantadine_um, :decimal
  end

  def self.down
    change_column :ic50_datas, :iC50_oseltamivir_munana_nm, :integer
    change_column :ic50_datas, :iC50_zanamivir_other_nm, :integer
    change_column :ic50_datas, :iC50_zanamivir_na_star_nm, :integer
    change_column :ic50_datas, :iC50_amantadine_um, :integer
    change_column :ic50_datas, :iC50_zanamivir_MUNANA_nm, :integer
    change_column :ic50_datas, :iC50_oseltamivir_other_nm, :integer
    change_column :ic50_datas, :iC50_oseltamivir_na_star_nm, :integer
    change_column :ic50_datas, :iC50_rimantadine_um, :integer
  end
end
