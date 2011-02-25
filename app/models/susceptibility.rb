class Susceptibility < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string, :required
    isolate_name    :string, :required, :unique #unique prevents the entry of duplicates
    virus_type enum_string(:A_H1N1, :A_H1N2, :A_H3N2, :A_H5N1, :A_H7N7, :B, :A_H1N1v) 
    source_virus_sentinel :boolean 
    source_virus_non_sentinel :boolean
    hospitalised :boolean
    institution :boolean
    community :boolean
    other :boolean
    other_namely :string
    not_known :boolean 
    date_specimen_collected :date
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
  #  location :string
    dob      :date
    gender   enum_string(:male,:female)
    date_onset_of_illness :date
    vaccinated_for_current_flu_season enum_string(:no, :yes, :not_known)
    no_exposure_to_flu_antivirals_patient :boolean
    yes_exposure_to_flu_antivirals_patient :boolean
    yes_exposure_to_flu_antivirals_patient_which_drug enum_string(:Oseltamivir, :Zanamivir, :Other_NAI, :Amantadine, :Rimantadine, :Combination_Oseltamivir_and_Zanamivir, :Combination_Oseltamivir_and_M2I, :Combination_Zanamivir_and_M2I, :Combination_other_NAI_and_M2I, :Unknown)
    not_known_exposure_to_flu_antivirals_patient :boolean
    no_exposure_to_flu_antivirals_household_contact :boolean
    yes_exposure_to_flu_antivirals_household_contact :boolean
    yes_exposure_to_flu_antivirals_household_contact_which_drug enum_string(:Oseltamivir, :Zanamivir, :Other_NAI, :Amantadine, :Rimantadine, :Combination_Oseltamivir_and_Zanamivir, :Combination_Oseltamivir_and_M2I, :Combination_Zanamivir_and_M2I, :Combination_other_NAI_and_M2I, :Unknown)
    not_known_exposure_to_flu_antivirals_household_contact :boolean
    geographic_location :string
    disease_progression_uncomplicated :boolean
    disease_progression_complicated :boolean
    disease_progression_complicated_pneumonia :boolean
    disease_progression_complicated_otitis_media :boolean
    disease_progression_complicated_other :boolean
    disease_progression_complicated_namely :string
    disease_progression_not_known :boolean
    hospitalisation enum_string(:no, :yes, :not_known)
    death enum_string(:no, :yes, :not_known)
#    note :html

    timestamps
  end
	
#	validates_date :date_specimen_collected => Date.nil

    belongs_to :season
    belongs_to :country
    belongs_to :virus_type

 
    # Paperclip
   has_attached_file :csv
#   before_post_process :image?
#   private
#   def image?
#   csv_content_type =~ /^image.*/
#   end

   validates_attachment_presence :csv
   validates_attachment_content_type :csv, :content_type => ['text/csv','text/comma-separated-values','text/csv','application/csv','application/excel','application/vnd.ms-excel','application/vnd.msexcel','text/anytext','text/plain'], :message => "only accepting .xls files at the moment"

   private
    def parse_csv_file
     FSCV.foreach(csv.path, :headers => true) do |row|
     susceptibility.create!(row.to_hash)
     flash[:notice] = 'CSV data was successfully imported.'
      end
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
