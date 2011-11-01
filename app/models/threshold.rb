

# A set of thresholds entries for several drugs for a given season.
#
# This would be better called a "Season threshold" as it is for for a given
# season, country & virus type.
#
class Threshold < ActiveRecord::Base

	hobo_model # Don't put anything above this

	## Fields & relationships:
	fields do
		description :text
		
		timestamps
	end
	
	belongs_to :season
	belongs_to :country
	belongs_to :pathogen_type
	
	has_many :thresholdentries, :dependent => :destroy, :accessible => true

	validates_presence_of :season_id 
	validates_presence_of :country_id 
	validates_presence_of :pathogen_type_id 
	
	# ensures that the combination of season, country and virus is unique
	# TODO: test
	validates_uniqueness_of(:pathogen_type_id, :scope => [
         :country_id,
         :season_id,
      ],
      :message => 'is already in our database for this season and country.'
   )

	## Permissions:
	def create_permitted?
		acting_user.administrator?
		#if acting_user.administrator?
		#	return true
		#else
		#	return acting_user.is_country_editor (country)
		#end
	end

	def update_permitted?
		acting_user.administrator?
	end

	def destroy_permitted?
		acting_user.administrator?
	end

	def view_permitted?(field)
		true
	end

	## Accessors:
	def name
		#return "#{virus_type.name} #{season.name} (#{country.name})"
		
		name_parts = []
		if ! pathogen_type.nil? then name_parts << pathogen_type.name end
		if ! season.nil? then name_parts << season.name end
		if ! country.nil? then name_parts << "(#{country.name})" end
		
		if 0 < name_parts.length
			return name_parts.join(' ')
		else
			return "No name (FIXME)"
		end
	end
	
end
