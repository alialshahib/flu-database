class UsersController < ApplicationController

  hobo_user_controller

  auto_actions(:all)  #, :except => [:view, :new, :create ] 
  
#  :except => [ :index, :new, :create ]

  autocomplete

  def do_signup
     hobo_do_signup do
       if this.errors.blank?
         flash[:notice] << "You must activate your account before you can log in.  Please check your email."
        end
     end
  end
end
