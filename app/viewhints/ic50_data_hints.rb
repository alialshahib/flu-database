class Ic50DataHints < Hobo::ViewHints

  model_name "IC50 Data"  

  field_names :iC50_zanamivir_MUNANA_nm => "IC50 Zanamivir (MUNANA) nM", :iC50_zanamivir_na_star_nm => "IC50 Zanamivir (NA Star) nM", :iC50_zanamivir_other_nm => "IC50 Zanamivir (other) nM", :iC50_oseltamivir_munana_nm => "IC50 Oseltamivir (MUNANA) nM", :iC50_oseltamivir_na_star_nm => "IC50 Oseltamivir (NA Star) nM", :iC50_oseltamivir_other_nm => "IC50 Oseltamivir(other) nM", :iC50_amantadine_um => "IC50 Amantadine um", :iC50_rimantadine_um => "IC50 Rimantadine um"
  # model_name "My Model"
  # field_names :field1 => "First Field", :field2 => "Second Field"
  # field_help :field1 => "Enter what you want in this field"
  # children :primary_collection1, :aside_collection1, :aside_collection2
end
