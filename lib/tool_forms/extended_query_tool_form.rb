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
		
	end

end


### END
