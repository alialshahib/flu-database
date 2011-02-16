class ToolHints < Hobo::ViewHints

  # model_name "My Model"
  
  field_names(
	 :tooltype => "Tool interface"
  )
  
  field_help(
	 :title => "What will the tool page be called? If none is supplied, the
		description of the tool interface will be used.",
	 :description => "How will the tool be described? If none is supplied, the
		description of the tool interface will be used.",
	 :tooltype => "What backend tool do you want this to attach to?"
  )

end
