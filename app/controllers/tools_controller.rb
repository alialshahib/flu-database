require 'pp'

class ToolsController < ApplicationController
	
	hobo_model_controller
	
	auto_actions :all
	show_action :detail
	
	def show
		hobo_show do
			pp "here"
			pp session
			pp request
		end
	end

    def execute
			pp "execute"
			pp session
			pp request
      redirect_to :action => 'index',
    end
    
end
