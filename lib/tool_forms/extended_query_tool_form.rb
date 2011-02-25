#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Tool for more complicated queries.

### IMPORTS


### IMPLEMENTATION

module ToolForms

	# A tool to handle complicated queries
	class ExtendedQueryToolForm < BaseToolForm
		
		## Accessors:
		@@submit_buttons = ['Query']
				
		def self.description
			# TODO: sucky description
			return 'Search the database with advanced options.'
		end
		
		def self.id
			return "exquery"
		end
		
		def self.submit_buttons
			return [['query', 'Query']]
		end
		
		## Validation:
		#def self.validate_country(param_str)
		#	cntry = Country.find(id=param_str.to_i)
		#	return cntry
		#	validate(false, "this is an error!")
		#end
		
		def self.validate_season(param_str)
			return param_str.to_i
		end
		
		def self.validate_country(param_str)
			return param_str.to_i
		end
		
		def self.validate_virustype(param_str)
			return param_str.to_i
		end
		
		#def self.validate_virustype(param_str)
		#	vt = VirusType.find(id=param_str.to_i)
		#	return vt
		#	validate(false, "this is another error!")
		#end
		
		## Service:
		
		# Return all resistance reports for this season & virus type & country
		def self.process(params)
			# TODO: allow multiple seaons & virus types? Ordering?
			pp "**** params #{params}"
			
			# retreive matching records
			reports = Susceptibility.scoped(:conditions => {
					:season_id => params['season'],
					:country_id => params['country'],
					:virus_type_id => params['virustype'],
				}
			)
			# if no matching, return no result answer
			if reports.empty?
				return [], []
			end
			
			# NOTE: returns results & errors
			return ["foo", 127], []
		end
				
	end

end


### END
