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
			return self.title.downcase.gsub(' ', '-').gsub('-', '_')
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
			return [['submit', 'Submit']]
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
		
		# Are the parameters in the request valid?
		#
		# Clean, validates and converts each parameters one by one, and calls for
		# parameters to be validated as a whole. Any errors are converted into
		# error messages. Cleaning and validation is devolved down to sub-methods
		# if supplied. If successful, the converted parameters are returned and
		# error messages. 
		def self.is_valid?(raw_params)
			# TODO: convert param ids to proper titles
			
			# what we#re collecting & returning
			converted_params = {}
			errors = []
			raw_params.each { |param_name, param_value|
				if ! ["controller", "action", "submit", "_submit"].member?(param_name)
					begin
						# Clean each param with name method if supplied, otherwise
						# use default method and "correct" parameters
						clean_meth_name = "clean_#{param_name}"
						if ! self.respond_to?(clean_meth_name)
							clean_meth_name = "clean_param"
						end
						clean_value = self.send(clean_meth_name, param_value)
						raw_params[param_name] = clean_value
	
						# Validate & convert each param with name method if supplied,
						# otherwise take as is. 
						validate_meth_name = "validate_#{param_name}"
						if self.respond_to?(validate_meth_name)
							converted_params[param_name] = self.send(validate_meth_name, clean_value)
						else
							converted_params[param_name] = clean_value
						end
					rescue Exception => err
						errors << [param_name, err.to_s]
					rescue
						errors << [param_name, "an unknown error occurred"]
					end
				end
			}
			
			# XXX: a bit fugly
			if (0 < errors.size)
				# if there are errors return failure & error list ...
				return false, errors
			else
				# ... otherwise, do overall check ...
				begin
					validate_all(converted_params)
					# ... if sucessful, return converted params and no errors ...
					return converted_params, []
				rescue Exception => err
					# ... otherwise, return failure and global error message
					return false, [[nil, err.to_s]]
				rescue
					return false, [[nil, "an unknown error occurred"]]
				end
			end
		end
	
		def self.clean_param(val_str)
			return val_str.strip()
		end

		def self.validate_all(params)
			# currently does nothing
		end
		
		def self.validate_foo(param_str)
			# NOTE: purely an example of how to validate & convert clean param
			validate(param_str.size < 10, "'#{param_str}#' is too long")
			return param_str.upcase()
		end
		
		def self.process(params)
			# NOTE: returns results & errors
			return ["foo", 127], []
		end
		
		def self.validate(test, msg)
			raise ValidationError, msg unless test
		end
	
	end

	class ValidationError < StandardError
	end
	
end


### END
