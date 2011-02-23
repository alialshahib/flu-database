class Patient < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title    :string, :required
    location :string 
    dob      :date
    gender   enum_string(:male,:female)
    date_onset_of_illness :date
    vaccinated :boolean
#    age      :integer
     
    timestamps
  end
  validates_length_of :title, :within => 2..20, :too_long => "pick a shorter
  name", :too_short => "pick a longer name"
#  validates_numericality_of :age 
  
  belongs_to :susceptibility
  

  # --- Permissions --- #

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
