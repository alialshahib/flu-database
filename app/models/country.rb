class Country < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
   # brazil    :string # :name => true # you put :name => true if you want a drop down list in the belongs_to (e.g. here susceptibility belong_to country).
    name enum_string(:brazil, :argentina, :chile, :colombia, :peru, :uruguay)

#    argentina :string, :name => true
#    chile     :string
#    colombia  :string
#    peru      :string
#    uruguay   :string
    timestamps
  end


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
