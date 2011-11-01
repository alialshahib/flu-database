
# And individual mutation  like 'H275Y'
#
# These do not exist independentally, only when associated with a sequence.
# Their only data is the descriptive string, which is required. They should
# not be empty (undescribed).
#
class SequenceMutation < ActiveRecord::Base
	
	## Model & relations:
	hobo_model # Don't put anything above this
	
	fields do
		description   :text, :required
	end
	
	belongs_to :susceptibility_sequence
	
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
