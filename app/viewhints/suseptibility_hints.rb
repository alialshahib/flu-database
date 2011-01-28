class SuseptibilityHints < Hobo::ViewHints
 
#  children :patients
#  children :sequences 

  field_help :season => "e.g. 2001/2002", :isolate_name => "Use the WHO standard, e.g. A/Baden-Wurttemberg/362/2005" 
  field_names :iC50_zanamivir_MUNANA_nm => "IC50 Zanamivir (MUNANA) nM", :iC50_zanamivir_na_star_nm => "IC50 Zanamivir (NA Star) nM", :iC50_zanamivir_other_nm => "IC50 Zanamivir (other) nM", :iC50_oseltamivir_munana_nm => "IC50 Oseltamivir (MUNANA) nM", :iC50_oseltamivir_na_star_nm => "IC50 Oseltamivir (NA Star) nM", :iC50_oseltamivir_other_nm => "IC50 Oseltamivir(other) nM", :iC50_amantadine_um => "IC50 Amantadine um", :iC50_rimantadine_um => "IC50 Rimantadine um", :na_sequence => "NA Sequence", :ha_sequence => "HA Sequence"

  #field_help :isolate_name => "Use the WHO standard, e.g. A/Baden-Wurttemberg/362/2005"
  # model_name "My Model"
  # field_names :field1 => "First Field", :field2 => "Second Field"
  # field_help :field1 => "Enter what you want in this field"
  # children :primary_collection1, :aside_collection1, :aside_collection2
end
