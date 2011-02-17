#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Abstract base class for the SAIRD tool definitions.

### IMPORTS

### IMPLEMENTATION

module ToolForms

	# The base class for all tools
	class BaseToolForm
		
		@@tool_subclass_hash = {}
		
		def self.subclass_hash
			@@tool_subclass_hash
		end
				
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

		# NOTE: can't have a "name" asttribute or ruby freaks out
		
		def self.value
			self.title
		end
		
		def self.to_s
			self.value + "to_s"
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
		def self.all_tools_ids
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

end


### END
