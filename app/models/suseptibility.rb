class Suseptibility < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string, :required
    season :string, :required
    isolate_name    :string, :required, :unique #unique prevents the entry of duplicates
    virus_type enum_string(:A_H1N1, :A_H1N2, :A_H3N2, :A_H5N1, :A_H7N7, :B, :A_H1N1v)
    source_virus enum_string(:Sentinel_patient, :Non_sentinel_patient) 
    hospitalised :boolean
    institution :boolean
    community :boolean
    other :string
    not_known :boolean 
    date_specimen_collected :date
    country enum_string(:brazil, :argentina, :chile, :colombia, :peru, :uruguay)
    iC50_zanamivir_MUNANA_nm :decimal
    iC50_zanamivir_na_star_nm :decimal
    iC50_zanamivir_other_nm :decimal
    iC50_oseltamivir_munana_nm :decimal
    iC50_oseltamivir_na_star_nm :decimal
    iC50_oseltamivir_other_nm :decimal
    iC50_amantadine_um :decimal
    iC50_rimantadine_um :decimal
    na_sequence  :string
    ha_sequence :string
    m2_sequence :string
    comment :text
    location :string
    dob      :date
    gender   enum_string(:male,:female)
    date_onset_of_illness :date
    vaccinated :boolean
#    note :html
    timestamps
  end

#  validates_length_of :isolate_name, :within => 2..20, :too_long => "pick a shorter
#  name", :too_short => "pick a longer name"
 
#  has_many :patients, :dependent => :destroy
#  has_many :sequences,:dependent => :destroy

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
   true 
  end

end
