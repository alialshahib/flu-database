class Mutation < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    sequence_id :integer
    description :html
    timestamps
  end

  belongs_to :susceptibility_sequence, :dependent => :destroy 

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
