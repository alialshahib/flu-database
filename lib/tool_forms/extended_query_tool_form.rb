#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Tool for more complicated queries.

### IMPORTS


### IMPLEMENTATION

module ToolForms

	# A tool to handle complicated queries
	class ExtendedQueryToolForm < BaseToolForm
		
		@@submit_buttons = ['Query']
				
		def self.description
			# TODO: sucky description
			return 'Search the database with advanced options.'
		end
		
		def self.id
			return "exquery"
		end
		
		def self.submit_buttons
			return [['query', 'Query']]
		end
		
		def self.validate_country(param_str)
			validate(false, "this is an error!")
		end
		
		def self.validate_season(param_str)
			validate(false, "this is another error!")
		end
		
	end

end


### END
