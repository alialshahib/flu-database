class SusceptibilitiesController < ApplicationController

  hobo_model_controller

  auto_actions :all
 
#  autocomplete_for :title

#def show
#  hobo_show :permission_denied_response => proc { 
#	render :text => "On yer bike sunshine!"
#  }, :not_found_response => proc {
#	redirect_to homepage_url
#  } 
#end 
end
