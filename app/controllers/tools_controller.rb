

class ToolsController < ApplicationController
	
	def index
	end
	
	def bulkupload
	end
	
	def exquery
		if request.parameters['_submit'].nil?
			session[:results] = nil
		else
			session[:results] = 'foo'			
		end
	end
	
	def graphresist
	end

end
