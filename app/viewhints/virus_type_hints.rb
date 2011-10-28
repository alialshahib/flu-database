class VirusTypeHints < Hobo::ViewHints

	model_name "Pathogen (sub)type"
	
	field_help :field1 => "Enter what you want in this field"
	
	children :thresholds
end
