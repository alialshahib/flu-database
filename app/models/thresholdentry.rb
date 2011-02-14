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
   belongs_to :drug
   
	# TODO: does this make for a unique drug in a threshold set?
	# XXX: index?
	validates_uniqueness_of(:threshold, :scope => :drug)
	
	# TODO: need to validate minor if less than major

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
