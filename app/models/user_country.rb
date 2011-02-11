# A join table for the many-to-many relationship between users & countries.
#
class UserCountry < ActiveRecord::Base
   
   hobo_model # Don't put anything above this
   
   ## Fields & relationships:
   fields do
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
