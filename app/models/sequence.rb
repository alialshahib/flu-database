class Sequence < ActiveRecord::Base

	## Model & relations:
	hobo_model # Don't put anything above this
	
	fields do
		 title :string
	end
	
	belongs_to :susceptibility, :dependent => :destroy
	belongs_to :gene
	has_many :sequence_mutations, :dependent => :destroy, :accessible => true
	
	## Validations:
	# TODO: check no duplicates in mutations
	
	## Permissions
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
