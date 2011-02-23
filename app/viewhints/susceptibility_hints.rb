class SusceptibilityHints < Hobo::ViewHints
 
#  children :patients
#  children :sequences 

  field_help :isolate_name => "Use the WHO standard, e.g. A/Baden-Wurttemberg/362/2005" 
  field_names :csv => "", :source_virus_sentinel => "Source Virus", :source_virus_non_sentinel => "", :hospitalised => "", :institution => "", :community => "", :other => "", :other_namely => "", :not_known => "", :iC50_zanamivir_MUNANA_nm => "IC50 Zanamivir (MUNANA) nM", :iC50_zanamivir_na_star_nm => "IC50 Zanamivir (NA Star) nM", :iC50_zanamivir_other_nm => "IC50 Zanamivir (other) nM", :iC50_oseltamivir_munana_nm => "IC50 Oseltamivir (MUNANA) nM", :iC50_oseltamivir_na_star_nm => "IC50 Oseltamivir (NA Star) nM", :iC50_oseltamivir_other_nm => "IC50 Oseltamivir(other) nM", :iC50_amantadine_um => "IC50 Amantadine um", :iC50_rimantadine_um => "IC50 Rimantadine um", :na_sequence => "NA Sequence", :ha_sequence => "HA Sequence", :no_exposure_to_flu_antivirals_patient => "", :yes_exposure_to_flu_antivirals_patient => "", :yes_exposure_to_flu_antivirals_patient_which_drug => "", :not_known_exposure_to_flu_antivirals_patient => "", :no_exposure_to_flu_antivirals_household_contact => "", :yes_exposure_to_flu_antivirals_household_contact => "", :yes_exposure_to_flu_antivirals_household_contact_which_drug => "", :not_known_exposure_to_flu_antivirals_household_contact => "", :disease_progression_uncomplicated => "", :disease_progression_complicated => "",  :disease_progression_complicated_pneumonia => "", :disease_progression_complicated_otitis_media => "", :disease_progression_complicated_other => "", :disease_progression_complicated_namely => "", :disease_progression_not_known => "", :geographic_location => "", :hospitalisation => "", :death => "", :dob => "", :gender => "", :date_onset_of_illness => "", :vaccinated_for_current_flu_season => ""




#vaccinated_for_current_flu_season enum_string(:no, :yes, :not_known)
#geographic_location :string
#hospitalisation enum_string(:no, :yes, :not_known)
#death enum_string(:no, :yes, :not_known)






  #field_help :isolate_name => "Use the WHO standard, e.g. A/Baden-Wurttemberg/362/2005"
  # model_name "My Model"
  # field_names :field1 => "First Field", :field2 => "Second Field"
  # field_help :field1 => "Enter what you want in this field"
  # children :primary_collection1, :aside_collection1, :aside_collection2
end
