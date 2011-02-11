
# A region and implied authority for that region
#
# In SAIRD, data is gathered per country and user access is restricted as per
# the countries they "belong" to.
#
class Country < ActiveRecord::Base

   hobo_model # Don't put anything above this
   
   # add in shared behaviour
   include ExtendedModelMixin
   
   ## Fields & relationships:
   fields do
      # brazil    :string # :name => true
      # you put :name => true if you want a drop down list in the belongs_to
      # (e.g. here susceptibility belong_to country).
      name  :string, :unique, :required
      
      timestamps
   end
   
   has_many :users, :through => :user_countries, :accessible => true
   has_many :user_countries, :dependent => :destroy
   
   ## Permissions:
   
   # Who is allowed to view the country?
   #
   # Currently, we let everyone see the country and the listing of who is a
   # member.
   #
   # TODO: customise this for different fields?
   #
   def read_permitted?
      return (acting_user.administrator? || true)
   end
   
   # Who is allowed to edit country data?
   #
   # Currently, we let everyone who is a member of the country to edit
   # everything about the country.
   #
   # TODO: this may need to be evolved. See comments in user_country.
   #
   def write_permitted?
      return (acting_user.administrator? || users.member?(acting_user))
   end

   # Who is allowed to view data asscociated with the country?
   #
   # This governs whether data that "belongs" to the country can be seen by a
   # user. Currently, we let everyone can edit the data see it, roughly the
   # story with the European database.
   #
   # TODO: this may need to be evolved.
   #
   def read_data_permitted?
      return write_data_permitted?
   end
   
   # Who is allowed to edit data asscociated with the country?
   #
   # This governs whether data that "belongs" to the country can be changed by a
   # user. Currently, we let everyone can edit the country, edit the data, which
   # equates to a member.
   #
   # TODO: this is a bit crude, may need to see evolved.
   #
   def write_data_permitted?
      return write_permitted?
   end
   
end
