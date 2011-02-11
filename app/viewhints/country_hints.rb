class CountryHints < Hobo::ViewHints
  # TODO: farm this off toe translations?
  
  model_name_plural "countries"
  
  children :users
  
  # TODO: point to data for every year?
  # children :users, :thresholds, 
end
