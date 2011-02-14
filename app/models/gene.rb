class Gene < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string, :required, :unique
    description :text
    timestamps
  end

  set_default_order :name

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
