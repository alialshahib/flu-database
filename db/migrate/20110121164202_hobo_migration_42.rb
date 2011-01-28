class HoboMigration42 < ActiveRecord::Migration
  def self.up
    add_column :suseptibilities, :iC50_zanamivir_MUNANA_nm, :decimal
    add_column :suseptibilities, :iC50_zanamivir_na_star_nm, :decimal
    add_column :suseptibilities, :iC50_zanamivir_other_nm, :decimal
    add_column :suseptibilities, :iC50_oseltamivir_munana_nm, :decimal
    add_column :suseptibilities, :iC50_oseltamivir_na_star_nm, :decimal
    add_column :suseptibilities, :iC50_oseltamivir_other_nm, :decimal
    add_column :suseptibilities, :iC50_amantadine_um, :decimal
    add_column :suseptibilities, :iC50_rimantadine_um, :decimal
    add_column :suseptibilities, :na_sequence, :string
    add_column :suseptibilities, :ha_sequence, :string
    add_column :suseptibilities, :m2_sequence, :string
    add_column :suseptibilities, :comment, :text
    add_column :suseptibilities, :location, :string
    add_column :suseptibilities, :dob, :date
    add_column :suseptibilities, :gender, :string
    add_column :suseptibilities, :date_onset_of_illness, :date
    add_column :suseptibilities, :vaccinated, :boolean
  end

  def self.down
    remove_column :suseptibilities, :iC50_zanamivir_MUNANA_nm
    remove_column :suseptibilities, :iC50_zanamivir_na_star_nm
    remove_column :suseptibilities, :iC50_zanamivir_other_nm
    remove_column :suseptibilities, :iC50_oseltamivir_munana_nm
    remove_column :suseptibilities, :iC50_oseltamivir_na_star_nm
    remove_column :suseptibilities, :iC50_oseltamivir_other_nm
    remove_column :suseptibilities, :iC50_amantadine_um
    remove_column :suseptibilities, :iC50_rimantadine_um
    remove_column :suseptibilities, :na_sequence
    remove_column :suseptibilities, :ha_sequence
    remove_column :suseptibilities, :m2_sequence
    remove_column :suseptibilities, :comment
    remove_column :suseptibilities, :location
    remove_column :suseptibilities, :dob
    remove_column :suseptibilities, :gender
    remove_column :suseptibilities, :date_onset_of_illness
    remove_column :suseptibilities, :vaccinated
  end
end
