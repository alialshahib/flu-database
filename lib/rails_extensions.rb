
class ActiveRecord::Base
		
	# Sanitize and check data when object changed.
	#
	# Ugh. Was this ever worth it? Basically this automagically calls
	# cleansing (conversion) and validation functions on every column by looking
	# for specially named method called ``clean_<foo>`` and ``validate_<foo>``.
	# The first accepts a value and should munge it to a canonical / acceptable
	# form (e.g. strip whitespace, convert type etc.) and return that value. The
	# second also accepts a value and should raise an informative error if it
	# doesn't validate / meet the acceptable form. All exceptions are caught
	# and converted to useful message for the appropriate field.
	#
	# It may be simpler to just put all validation/checking in the clean function.
	#
	def validate
		# TODO: an overall validate fields for constraints that depend on multiple
		# fields?
		self.class.content_columns.each { |c|
			col_name = c.name
			if ! ['created_at', 'updated_at'].member?(col_name)
				begin
					# if a cleaning method is supplied, pass value to it
					clean_meth_name = "clean_#{col_name}"
					pp "looking for #{clean_meth_name} ..."
					if self.respond_to?(clean_meth_name)
						self[col_name] = self.send(clean_meth_name,
							self[col_name])
					end
					# if a validation method is supplied, get it checked
					validate_meth_name = "validate_#{col_name}"
					pp "looking for #{validate_meth_name} ..."
					if self.respond_to?(validate_meth_name)
						self.send(validate_meth_name, self[col_name])
					end
				rescue Exception => err
					errors.add(col_name.to_sym, err.to_s)
				rescue
					errors.add(col_name.to_sym, "an unknown error occurred")
				end
			end
		}
	end
		
end

