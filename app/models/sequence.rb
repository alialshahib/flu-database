class Sequence < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string, :required
#    isd_number :string
#    aa_resistance_mutations :string
    na_sequence  :string
    ha_sequence :string
    m2_sequence :string
    comment :text
#   body :markdown
    timestamps
  end
 
  belongs_to :susceptibility, :dependent => :destroy
#  has_many :mutations, :dependent => :destroy

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
