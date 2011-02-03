class Season < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name enum_string(:A2001, :B2003)
    timestamps
  end

  has_many :threshold

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
