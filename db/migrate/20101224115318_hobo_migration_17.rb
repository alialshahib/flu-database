class HoboMigration17 < ActiveRecord::Migration
  def self.up
    change_column :ic50_datas, :iC50_oseltamivir_munana_nm, :integer, :limit => nil
    change_column :ic50_datas, :iC50_zanamivir_other_nm, :integer, :limit => nil
    change_column :ic50_datas, :iC50_zanamivir_na_star_nm, :integer, :limit => nil
    change_column :ic50_datas, :iC50_amantadine_um, :integer, :limit => nil
    change_column :ic50_datas, :iC50_zanamivir_MUNANA_nm, :integer, :limit => nil
    change_column :ic50_datas, :iC50_oseltamivir_other_nm, :integer, :limit => nil
    change_column :ic50_datas, :iC50_oseltamivir_na_star_nm, :integer, :limit => nil
    change_column :ic50_datas, :iC50_rimantadine_um, :integer, :limit => nil
  end

  def self.down
    change_column :ic50_datas, :iC50_oseltamivir_munana_nm, :string
    change_column :ic50_datas, :iC50_zanamivir_other_nm, :string
    change_column :ic50_datas, :iC50_zanamivir_na_star_nm, :string
    change_column :ic50_datas, :iC50_amantadine_um, :string
    change_column :ic50_datas, :iC50_zanamivir_MUNANA_nm, :string
    change_column :ic50_datas, :iC50_oseltamivir_other_nm, :string
    change_column :ic50_datas, :iC50_oseltamivir_na_star_nm, :string
    change_column :ic50_datas, :iC50_rimantadine_um, :string
  end
end
