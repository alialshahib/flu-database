class CountryHints < Hobo::ViewHints
  # TODO: override header and lead-in to properly capitalise
# TODO: have country card list numbers of reports and thresholds
  
  model_name "Reporting Country"
  model_name_plural "Reporting Countries"
  
  field_names(
	 # NOTE: curious - this is not used. works for for fields
	 :users => "Members"
  )
  
  children :users
  
  # TODO: point to data for every year?
  # children :users, :thresholds, 
end
