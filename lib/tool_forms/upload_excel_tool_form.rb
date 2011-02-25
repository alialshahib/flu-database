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
			pp "**** path #{params['spreadsheet'].original_filename}"
			
			sheet_file = params['spreadsheet']
			sheet_file_name = sheet_file.original_filename
			file_ext = sheet_file_name.original_filename[/\.\w+$/]
			if file_ext.nil?
				return [], ["can't determine file type of '#{sheet_file_name}'"]
			end
			file_ext = file_ext[1,x.size].downcase()
			if ! ['xls', 'xlsx'].member?(file_ext)
				return [], ["can't handle files of type '#{file_ext}'"]
			end
			
			rdr = SpreadsheetReader::ExcelReader.new(sheet_file, :file_type => file_ext)
			rdr.read() { |rec|
				pp rec
			}

			# NOTE: returns results & errors
			return ["foo", 127], []
		end
		
	end

end


### END
