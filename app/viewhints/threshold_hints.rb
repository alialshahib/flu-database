class ThresholdHints < Hobo::ViewHints

  model_name "Season threshold report"

  field_help(
	 :description => "How were the cutoff values arrived at."
  )
  
  
  # TODO: how do we name this?
  #children :thresholdentry
end
