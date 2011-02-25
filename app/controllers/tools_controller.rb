

class ToolsController < ApplicationController
	
	def index
	end
	
	def bulkupload
		session[:results] = process_form(ToolForms::UploadExcelToolForm, request)
	end
	
	def exquery
		session[:results] = process_form(ToolForms::ExtendedQueryToolForm, request)
	end
	
	def graphresist
		session[:results] = process_form(ToolForms::GraphResistToolForm, request)
	end

end


def process_form(tf, req)
	# XXX: this is not great and puts far to much work in the controller
	# TODO: refactor or more to a more logical place
	
	# The torturous logic of this method: we are handed a toolform & request ...
	# Only process form if there has been a submission, otherwise results are nil
	results = nil
	if ! req.parameters['_submit'].nil?
		# check for errors in parameters and clean them up
		conv_params, errors = tf.is_valid?(req.parameters)
		# if we get parameters back, it's okay, process it
		if conv_params
			results, errors = tf.process(conv_params)
		end
		# if there are any errors (from validation or processing), show them
		if 0 < errors.size()
			flash[:error] = errors.collect { |e|
				msg = e[0].nil? ? e[1] : "#{e[0].capitalize}: #{e[1]}"
				"<p>#{msg}</p>"
			}.join("\n")
			results = nil
		end
	end

	# return results, whch should be nil if no action (error or no process),
	# an empty array if processing suceeded but there's no results, and a
	# non-empty result if there are results.
	return results
end
