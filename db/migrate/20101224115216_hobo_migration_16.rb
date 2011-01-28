class HoboMigration16 < ActiveRecord::Migration
  def self.up
    add_column :ic50_datas, :iC50_zanamivir_na_star_nm, :string
    add_column :ic50_datas, :iC50_zanamivir_other_nm, :string
    add_column :ic50_datas, :iC50_oseltamivir_munana_nm, :string
    add_column :ic50_datas, :iC50_oseltamivir_na_star_nm, :string
    add_column :ic50_datas, :iC50_oseltamivir_other_nm, :string
    add_column :ic50_datas, :iC50_amantadine_um, :string
    add_column :ic50_datas, :iC50_rimantadine_um, :string
  end

  def self.down
    remove_column :ic50_datas, :iC50_zanamivir_na_star_nm
    remove_column :ic50_datas, :iC50_zanamivir_other_nm
    remove_column :ic50_datas, :iC50_oseltamivir_munana_nm
    remove_column :ic50_datas, :iC50_oseltamivir_na_star_nm
    remove_column :ic50_datas, :iC50_oseltamivir_other_nm
    remove_column :ic50_datas, :iC50_amantadine_um
    remove_column :ic50_datas, :iC50_rimantadine_um
  end
end
