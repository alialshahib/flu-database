class PatientsController < ApplicationController

  hobo_model_controller
  
  auto_actions :all
  #auto_actions :all, :except => :modify 
  #auto_actions :read_only
  #auto_actions_for :suseptibility, [:new, :create]

end
