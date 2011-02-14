class AddedThresholdEntry < ActiveRecord::Migration
  def self.up
    create_table :thresholdentries do |t|
      t.float    :minor
      t.float    :major
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :suseptibilities, :source_virus_sentinel, :boolean
    add_column :suseptibilities, :source_virus_non_sentinel, :boolean
    add_column :suseptibilities, :other_namely, :string
    add_column :suseptibilities, :vaccinated_for_current_flu_season, :string
    add_column :suseptibilities, :no_exposure_to_flu_antivirals_patient, :boolean
    add_column :suseptibilities, :yes_exposure_to_flu_antivirals_patient, :boolean
    add_column :suseptibilities, :yes_exposure_to_flu_antivirals_patient_which_drug, :string
    add_column :suseptibilities, :not_known_exposure_to_flu_antivirals_patient, :boolean
    add_column :suseptibilities, :no_exposure_to_flu_antivirals_household_contact, :boolean
    add_column :suseptibilities, :yes_exposure_to_flu_antivirals_household_contact, :boolean
    add_column :suseptibilities, :yes_exposure_to_flu_antivirals_household_contact_which_drug, :string
    add_column :suseptibilities, :not_known_exposure_to_flu_antivirals_household_contact, :boolean
    add_column :suseptibilities, :geographic_location, :string
    add_column :suseptibilities, :disease_progression_uncomplicated, :boolean
    add_column :suseptibilities, :disease_progression_complicated, :boolean
    add_column :suseptibilities, :disease_progression_complicated_pneumonia, :boolean
    add_column :suseptibilities, :disease_progression_complicated_otitis_media, :boolean
    add_column :suseptibilities, :disease_progression_complicated_other, :boolean
    add_column :suseptibilities, :disease_progression_complicated_namely, :string
    add_column :suseptibilities, :disease_progression_not_known, :boolean
    add_column :suseptibilities, :hospitalisation, :string
    add_column :suseptibilities, :death, :string
    add_column :suseptibilities, :csv_file_name, :string
    add_column :suseptibilities, :csv_content_type, :string
    add_column :suseptibilities, :csv_file_size, :integer
    add_column :suseptibilities, :csv_updated_at, :datetime
    change_column :suseptibilities, :other, :boolean, :limit => nil

    add_column :thresholds, :virustype_id, :integer
    remove_column :thresholds, :virus_type

    add_index :thresholds, [:virustype_id]
  end

  def self.down
    remove_column :suseptibilities, :source_virus_sentinel
    remove_column :suseptibilities, :source_virus_non_sentinel
    remove_column :suseptibilities, :other_namely
    remove_column :suseptibilities, :vaccinated_for_current_flu_season
    remove_column :suseptibilities, :no_exposure_to_flu_antivirals_patient
    remove_column :suseptibilities, :yes_exposure_to_flu_antivirals_patient
    remove_column :suseptibilities, :yes_exposure_to_flu_antivirals_patient_which_drug
    remove_column :suseptibilities, :not_known_exposure_to_flu_antivirals_patient
    remove_column :suseptibilities, :no_exposure_to_flu_antivirals_household_contact
    remove_column :suseptibilities, :yes_exposure_to_flu_antivirals_household_contact
    remove_column :suseptibilities, :yes_exposure_to_flu_antivirals_household_contact_which_drug
    remove_column :suseptibilities, :not_known_exposure_to_flu_antivirals_household_contact
    remove_column :suseptibilities, :geographic_location
    remove_column :suseptibilities, :disease_progression_uncomplicated
    remove_column :suseptibilities, :disease_progression_complicated
    remove_column :suseptibilities, :disease_progression_complicated_pneumonia
    remove_column :suseptibilities, :disease_progression_complicated_otitis_media
    remove_column :suseptibilities, :disease_progression_complicated_other
    remove_column :suseptibilities, :disease_progression_complicated_namely
    remove_column :suseptibilities, :disease_progression_not_known
    remove_column :suseptibilities, :hospitalisation
    remove_column :suseptibilities, :death
    remove_column :suseptibilities, :csv_file_name
    remove_column :suseptibilities, :csv_content_type
    remove_column :suseptibilities, :csv_file_size
    remove_column :suseptibilities, :csv_updated_at
    change_column :suseptibilities, :other, :string

    remove_column :thresholds, :virustype_id
    add_column :thresholds, :virus_type, :string

    drop_table :thresholdentries

    remove_index :thresholds, :name => :index_thresholds_on_virustype_id rescue ActiveRecord::StatementInvalid
  end
end
