class CountryHints < Hobo::ViewHints
  # TODO: farm this off toe translations?
  
  #model_name_plural "Countries"
  
  field_names(
	 # NOTE: curious - this is not used. works for for fields
	 :users => "members"
  )
  
  children :users
  
  # TODO: point to data for every year?
  # children :users, :thresholds, 
end
