class ThresholdHints < Hobo::ViewHints
	
	model_name "Seasonal threshold"
	
	field_help(
		:description => "How were the cutoff values arrived at.",
		:country => "What reporting region is this set of thresholds for?",
		:season =>"During what season do these thresholds hold?",
		:pathogen_type => "In what virus are these thresholds being counted?",
	)
	
	# TODO: how do we name this?
	children :thresholdentries
end
