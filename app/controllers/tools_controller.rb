

class ToolsController < ApplicationController
	
	def index
	end
	
	def bulkupload
	end
	
	def exquery
		session[:results] = process_form(ToolForms::ExtendedQueryToolForm, request)
	end
	
	def graphresist
	end

end

def process_form(tf, req)
	# The torturous logic of this method: we are handed a toolform & request ...
	# Only process form if there has been a submission, otherwise results are nil
	results = nil
	if ! request.parameters['_submit'].nil?
		# check for errors in parameters and clean them up
		conv_params, errors = tf.is_valid?(req.parameters)
		# if we get parameters back, it's okay, process it
		if conv_params
			results, errors = tf.process(conv_params)
		end
		# if there are any errors (from validation or processing), show them
		if 0 < errors.size()
			flash[:error] = errors.collect { |e|
				e[0].nil? ? e[1] : "#{e[0].capitalize}: #{e[1]}"
			}.join('<br />')
			results = nil
		end
	end

	# return results, whch should be nil if no action (error or no process),
	# an empty array if processing suceeded but there's no results, and a
	# non-empty result if there are results.
	return results
end
