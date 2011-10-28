class Susceptibility < ActiveRecord::Base

	hobo_model # Don't put anything above this

	## Db model & relationships:
	fields do
		isolate_name   :string, :required, :unique
		collected      :date
		comment        :text

		timestamps
	end
	
	belongs_to :season
	belongs_to :country
	belongs_to :virus_type
	has_many :susceptibility_entries, :dependent => :destroy, :accessible => true
	# has_many :sequences,:dependent => :destroy
	
	## Validation:
	validates_presence_of :season_id 
	validates_presence_of :country_id 
	validates_presence_of :virus_type_id 
	
	
	
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
	
	## Accessors:
	def name
		return isolate_name
	end

end
