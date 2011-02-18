class ThresholdHints < Hobo::ViewHints

  model_name "Season threshold report"

  field_help(
	 :description => "How were the cutoff values arrived at."
  )
  field_names :zanamivir_munana_minor_outlier => "", :zanamivir_munana_major_outlier => "", :zanamivir_nastar_minor_outlier => "", :zanamivir_nastar_major_outlier => "", :zanamivir_other_minor_outlier => "", :zanamivir_other_major_outlier => "", :oseltamivir_munana_minor_outlier => "", :oseltamivir_munana_major_outlier => "", :oseltamivir_nastar_minor_outlier => "", :oseltamivir_nastar_major_outlier => "", :oseltamivir_other_minor_outlier => "", :oseltamivir_other_major_outlier => "", :amantadine_munana_minor_outlier => "", :amantadine_munana_major_outlier => "", :rimantadine_munana_minor_outlier => "", :rimantadine_munana_major_outlier => ""
  # TODO: how do we name this?
  #children :thresholdentry
end
