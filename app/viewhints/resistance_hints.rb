class ResistanceHints < Hobo::ViewHints

	model_name "Potential Resistance resistance"
	
	field_names({
		:unit => "Unit of measurement",
	})
	
	field_help({
		:description => "How the resistance is measured, etc.",
		:unit => "E.g. nM, uM",
		
	})
	
	# TODO: enable viewing of thresholds and reports from drug
	#children :thresholds
	
end
