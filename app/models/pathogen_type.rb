
# A virus (alright pathogen) type or subtype that can be tested or drug resistance.
#
class PathogenType < ActiveRecord::Base

	hobo_model # Don't put anything above this
	
	fields do
		name          :string, :required, :unique
		description   :text
		timestamps
	end
	
	set_default_order :name
	
	has_many :thresholds
	
	
	## Permissions:
	# Is vocabulary so can only be edited by admins:
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
