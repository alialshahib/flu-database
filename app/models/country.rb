
# A region and implied authority for that region
#
# In SAIRD, data is gathered per country and user access is restricted as per
# the countries they "belong" to.
#
class Country < ActiveRecord::Base

   hobo_model # Don't put anything above this
   
   ## Fields & relationships:
   fields do
      # brazil    :string # :name => true
      # you put :name => true if you want a drop down list in the belongs_to
      # (e.g. here susceptibility belong_to country).
      
      name enum_string(:brazil, :argentina, :chile, :colombia, :peru, :uruguay),
         :unique, :required
   
      timestamps
   end
   
   has_many :users, :through => :user_countries, :accessible => true
   has_many :user_countries, :dependent => :destroy
   
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
