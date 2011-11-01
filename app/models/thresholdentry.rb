# The minor and major thresholds for a given drug.
#
# This is given in the context of athreshold, which is for a given season,
# country and virus.
#
class Thresholdentry < ActiveRecord::Base

	hobo_model # Don't put anything above this

	## Fields & relationships:
	fields do
		minor :float
		major :float

		timestamps
	end

	belongs_to :threshold
	belongs_to :resistance

	## Validations:
	validates_presence_of :resistance_id

	def validate
		if self ['major'] <= self['minor']
			errors.add('minor', 'minor cutoff must be greater than major')
		end
	end

	## Accessors:
	def name
		return "%s (%s-%s%s)" % [
			resistance.nil? ? '-' : resistance.name,
			minor.nil? ? '-' : minor,
			major.nil? ? '-' : major,
			resistance.nil? ? '' : resistance.unit,
		]
	end


	## Permissions:
	def create_permitted?
		acting_user.administrator?
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

end
