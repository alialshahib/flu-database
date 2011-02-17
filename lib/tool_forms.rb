#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Source file for the SAIRD tool definitions.

### IMPORTS

# Force the reading of the various tool definitions, base class first
# NOTE: this is all a bit ugly. By calling upon the module ToolForms, rails
# automagically calls this file (tool_forms.rb) in the lib directory. But to get
# this to load the stuff in the tool_forms directory, we have to give it an
# relative path from the working directory, the root of the rails installation.
# Then, as the tools are all based off an abstract base class, each subclass
# needs to know about the base class. But rather than having each require a
# relative path from the root, we just force the base class to load first. In
# conclusion, Ruby's import mechanism sucks.

require './lib/tool_forms/base_tool_form.rb'

Dir['./lib/tool_forms/*.rb'].each { |lib|
	require lib
}


### IMPLEMENTATION

module ToolForms

	def all_tool_form_ids
		tool_hsh = BaseToolForm.subclass_hash
		return tool_hsh.keys
	end
	module_function :all_tool_form_ids
	
	def tool_form_ids_to_titles
		tool_hsh = BaseToolForm.subclass_hash
		title_hsh = Hash.new()
		tool_hsh.each { |k,v|
			title_hsh[k] = v.title
		}
		return tool_hsh
	end
	module_function :tool_form_ids_to_titles
	
	def tool_id_to_cls(id)
		tool_hsh = BaseToolForm.subclass_hash
		return tool_hsh[id]
	end
	module_function :tool_id_to_cls
	
end


### END
