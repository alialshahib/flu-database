#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Tool for bulk uploading of susceptibility data.

### IMPORTS


### IMPLEMENTATION

module ToolForms

	# A tool to handle the excel bulk uploads
	class UploadExcelToolForm < BaseToolForm
		
		def self.title
			return 'Bulk upload of susceptibility data'
		end
		
		def self.description
			return """Upload multiple susceptibility reports into the database via an
				Excel spreadsheet."""
		end
		
		def self.id
			return 'bulkupload'
		end
	end

end


### END
