class Threshold < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    season :string
    virus_type enum_string(:A_H1N1, :A_H1N2, :A_H3N2, :A_H5N1, :A_H7N7, :B, :A_H1N1v)
    description_of_how_cuttoff_values_were_calculated :text
    has_attached_file :photo
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
