require 'pp'

class ToolsController < ApplicationController
	
	hobo_model_controller
	
	auto_actions :all
	show_action :detail
	
	def show
		hobo_show do
			pp "here"
			pp request.parameters
		end
	end

end
