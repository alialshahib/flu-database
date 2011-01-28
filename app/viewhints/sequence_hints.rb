class SequenceHints < Hobo::ViewHints

#  children :mutations  

  field_names :na_sequence => "NA Sequence", :ha_sequence => "HA Sequence"
  
#   rows ({
#                :title => 5,
#        })
#   set_defaults

  # model_name "My Model"
  # field_names :field1 => "First Field", :field2 => "Second Field"
  # field_help :field1 => "Enter what you want in this field"
  # children :primary_collection1, :aside_collection1, :aside_collection2
end
