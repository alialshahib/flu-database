class Resistance < ActiveRecord::Base

	hobo_model # Don't put anything above this
	
   # add in shared behaviour
   include ExtendedModelMixin
   
	## Db model & relationships:
	fields do
		name        :string, :required, :unique
		description :text
		unit        :text
	
		timestamps
	end
	
	set_default_order :name

	## Validations:
	def clean_name(v)
		return v.strip()
	end	
	
	def clean_description(v)
		return v.strip()
	end	
	
	def clean_unit(v)
		return v.strip()
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

	## Accessors:

end
