

# A set of thresholds entries for several drugs.
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
	belongs_to :virus_type
	has_many :threshold_entries, :dependent => :destroy, :accessible => true

	# TODO: unclear if this assures a unique combination of virus, season and
	# country in all directions. Something like this:
	#  add_index :A, [:B, :C], :unique => true
	# to ensure uniqueness on db level?
	validates_uniqueness_of(:virus_type_id, :scope => [
         :country_id,
         :virus_type_id,
      ]
   )

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
