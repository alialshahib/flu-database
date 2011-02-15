#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Source file for the SAIRD tool definitions.

### IMPORTS

### IMPLEMENTATION

module ToolForms

	def all_tool_forms
		BaseToolForm.all_tools
	end
	module_function :all_tool_forms
	
	def tool_id_to_cls(id)
		BaseToolForm.tool_id_to_cls(id)
	end
	module_function :tool_id_to_cls
	
	
	# The base class for all tools
	class BaseToolForm
		
		@@tool_subclasses = []
		@@tool_subclass_hash = {}
		
		# A default title, to be overidden in subclass
		#
		# By default converts the class name into words, removes 'tool' and turns it
		# into sentence case.
		#
		def self.title
			cls_title = self.name.split('::')[-1]
			cls_title.gsub!(/ToolForm$/, '')
			words = cls_title.split(/(?=[A-Z])/).map{ |w| w.downcase }
			words[0].capitalize!
			return words.join(" ")
		end
		
		# A default description, to be overidden in subclass
		def self.description
			'NO DESCRIPTION'
		end
		
		# Return an identifier unique to this class.
		#
		# Used for distinguishing between tools. By default just uses the title in
		# lowercase and hyphenated.
		#
		def self.id
			return self.title.downcase.gsub(' ', '-')
		end
		
		# Return all tool subclasses
		def self.all_tools
			return @@tool_subclass_hash.values
		end
		
		# Record any subclasses
		#
		def self.inherited(cls)
			# TODO: check there isn't a pre-existing one with that id
			@@tool_subclass_hash[cls.id] = cls
		end
	
		def tool_id_to_cls(id)
			return @@tool_subclass_hash[id]
		end
	
	end

	
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
	
	
	# A tool to handle complicated queries
	class ExtendedQueryToolForm < BaseToolForm
		
		def self.description
			return 'Upload multiple suspetibility reports into the database via an
				Excel spreadsheet.'
		end
		
	end

end


### END
