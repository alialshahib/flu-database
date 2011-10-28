
# An line in a susceptibility report, giving a drug and a measure
#
class SusceptibilityEntry < ActiveRecord::Base

	hobo_model # Don't put anything above this
	
   # add in shared behaviour
   include ExtendedModelMixin
   
   ## Db model & relations:
	fields do
		measure     :float, :required
		
		timestamps
	end
	
	belongs_to :susceptibility
	belongs_to :drug
	
	validates_numericality_of :measure, :greater_than_or_equal_to => 0.0 
	#validates_presence_of :susceptibility_id 
	validates_presence_of :drug_id 

	## Permissions:

	## Accessors:
	def name
		
	end
end
