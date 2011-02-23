class Ic50Data < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string, :required
    iC50_zanamivir_MUNANA_nm :decimal
    iC50_zanamivir_na_star_nm :decimal
    iC50_zanamivir_other_nm :decimal
    iC50_oseltamivir_munana_nm :decimal
    iC50_oseltamivir_na_star_nm :decimal
    iC50_oseltamivir_other_nm :decimal
    iC50_amantadine_um :decimal
    iC50_rimantadine_um :decimal
    timestamps
end

  belongs_to :susceptibility

#  named_scope :viewable, lambda {|acting_user| {:conditions =>"#{acting_user.signed_up??1:0}=1 or lifecycle_state='published'" }}
  
#  lifecycle :state_field => :lifecycle_state do

#  state :not_published, :default => :true
#  state :published

#  transition :publish, { :not_published => :published }, :available_to => "acting_user if acting_user.signed_up?"
#  transition :not_publish, { :published => :not_published },:available_to => "acting_user if acting_user.signed_up?"
# end

#    validates_numericality_of :iC50_zanamivir_MUNANA_nm
#    validates_numericality_of :iC50_zanamivir_na_star_nm
#    validates_numericality_of :iC50_zanamivir_other_nm
#    validates_numericality_of :iC50_oseltamivir_munana_nm
#    validates_numericality_of :iC50_oseltamivir_na_star_nm
#    validates_numericality_of :iC50_oseltamivir_other_nm
#    validates_numericality_of :iC50_amantadine_um
#    validates_numericality_of :iC50_rimantadine_um
    
#     validates_length_of :iC50_zanamivir_MUNANA_nm, :within => 0.00..9999.99 

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
