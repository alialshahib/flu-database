class ThresholdentryHints < Hobo::ViewHints
	# TODO: make sure it draws the units on stuff appropriately
	
	model_name "Drug resistance threshold"
	
	field_names({
		:minor => "Minor cutoff",
		:major => "Major cutoff",
	})

	field_help({
		:minor => "Lower threshold for resistance outliers",
		:major => "Higher threshold for resistance outliers",
	})

end
