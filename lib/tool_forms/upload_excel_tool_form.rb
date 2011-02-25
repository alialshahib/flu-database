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
		
		def self.form_method
			return "POST"
		end
		
		## Services:
		
		# Return all resistance reports for this season & virus type & country
		def self.process_default(params)
			# TODO: allow multiple seaons & virus types? Ordering?
			pp "**** params #{params}"
			pp params["spreadsheet"].methods.sort
			
			# NOTE: returns results & errors
			return ["foo", 127], []
		end
		
	end

end


### END
