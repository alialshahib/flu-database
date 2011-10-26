
# A join table for the many-to-many relationship between users & countries.
#
#
class UserCountry < ActiveRecord::Base

	hobo_model # Don't put anything above this

	## Defines & Constants:
	
	# what can the user do with the country?
	Level = HoboFields::EnumString.for(:reader, :editor, :manager)
	
	## Fields & relationships:
	# TODO: may need to set levels of access / user level for each country, such
	#   as can view (reader), can add & edit seasons (editor), can add members
	# and edit country data (manager). Also add thresholds?
	fields do
		level         UserCountry::Status, :required, :default => :editor
		
		timestamps
	end

	belongs_to :user
	belongs_to :country

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
