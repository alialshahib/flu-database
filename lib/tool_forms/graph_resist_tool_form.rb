#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Tool for graphing susceptibility data.

### IMPORTS


### IMPLEMENTATION

module ToolForms

	class GraphResistToolForm < BaseToolForm
		# TODO: we need a lot better description about this sucker
		
		def self.title
			return 'Graph resistance data'
		end
		
		def self.description
			return """Produce box and scatter plots of resistance data."""
		end
		
		def self.id
			return 'bulk-susp-upload'
		end
	end

end


### END
