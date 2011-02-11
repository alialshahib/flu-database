class User < ActiveRecord::Base
   
  hobo_user_model # Don't put anything above this
   
   ## Fields & relationships:
   fields do
      name          :string, :required, :unique
      user_name     :string, :unique, :login => true
      email_address :email_address, :required, :unique
      administrator :boolean, :default => false
      timestamps
   end
   
   has_many :countries, :through => :user_countries
   has_many :user_countries, :dependent => :destroy

   ## Lifecycle & transitions:
   
   # This gives admin rights to the first sign-up.
   # Just remove it if you don't want that
   before_create { |user|
      user.administrator = true if !Rails.env.test? && count == 0
   }
   
   lifecycle do
      state(:active, :default => true)
      create(:signup,
         :available_to => "Guest",
         :params => [
            # TODO: anyway of labelling fields other than hints
            :name,
            :user_name,
            :email_address,
            :password,
            :password_confirmation
         ],
         :become => :active
      )
    transition :request_password_reset, { :active => :active }, :new_key => true do
       UserMailer.deliver_forgot_password(self, lifecycle.key)
     end
   
     transition :reset_password, { :active => :active }, :available_to => :key_holder,
                :params => [ :password, :password_confirmation ]

   end

   ## Permissions:
   def create_permitted?
      false 
   end
   
   # What do we allow users to change about their data?
   #
   def update_permitted?
      # TODO: any other fields?
      # TODO: so does this show them the adminstrator field anyway?
      acting_user.administrator? || (acting_user == self && only_changed?(
            # what fields the user is permitted to change
            # NOTE: crypted_password has attr_protected so although it is can
            # change, it cannot be changed directly from a form submission
            :name,
            :user_name,
            :email_address,
            :crypted_password,
            :current_password,
            :password,
            :password_confirmation
         )
      )
      # Note: 
   end
   
   def destroy_permitted?
      acting_user.administrator?
   end
   
   def view_permitted?(field)
      # TODO: maybe change so only viewable by other country members?
      true
   end

end
