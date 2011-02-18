#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Abstract base class for the SAIRD tool definitions.

### IMPORTS

### IMPLEMENTATION

module ToolForms

	# The base class for all tools
	class BaseToolForm
		
		## Members:
		@@submit_buttons = ['Submit']

		
		## Accessors:
		
		# Return an identifier unique to this class.
		#
		# Used for distinguishing between tools. By default just uses the title in
		# lowercase and hyphenated.
		#
		def self.id
			return self.title.downcase.gsub(' ', '-')
		end
		
		# A default title, to be overidden in subclass
		#
		# By default converts the class name into words, removes the trailing
		# words and turns it into sentence case.
		#
		def self.title
			# NOTE: 'name' is the class name
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
		
		# Get the submit buttons for the form.
		#
		# These are returned as pairs (value, text) but can be set in the
		# class var as just the text, in which case the value is derived by
		# lowercasing it and converting spaces to underscores.
		def self.submit_buttons
			return @@submit_buttons.collect { |b|
				if b.is_a?(Array)
					b
				else
					[b.downcase.gsub(' ', '_'), b]
				end
			}
		end
		
		def self.has_reset_button
			true
		end
		
		# Get the hash of subclasses and their ids
		#
		def self.subclass_hash
			@@tool_subclass_hash
		end

		# Return all tool subclass ids
		#
		def self.all_tools_ids
			return @@tool_subclass_hash.values
		end
	
		# Return the subclass coresponding to this id.
		#
		def tool_id_to_cls(id)
			# XXX? not needed, put in module?
			return @@tool_subclass_hash[id]
		end
		
		## Internals:
		
		# all subclasses
		@@tool_subclass_hash = {}
		
		# Record any subclasses
		#
		# Called when a subclass is defined.
		#
		def self.inherited(cls)
			# TODO: check there isn't a pre-existing one with that id
			@@tool_subclass_hash[cls.id] = cls
		end
	
	end

end


### END
