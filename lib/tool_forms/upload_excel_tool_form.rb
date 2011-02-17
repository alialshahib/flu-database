#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Tool for bulk uploading of suseptibility data.

### IMPORTS


### IMPLEMENTATION

module ToolForms

	# A tool to handle the excel bulk uploads
	class UploadExcelToolForm < BaseToolForm
		
		def self.title
			return 'Bulk upload of suseptibility data'
		end
		
		def self.description
			return 'Upload multiple suspetibility reports into the database via an
				Excel spreadsheet.'
		end
		
		def self.id
			return 'bulk-susp-upload'
		end
	end

end


### END
