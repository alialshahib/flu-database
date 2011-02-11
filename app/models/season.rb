class Season < ActiveRecord::Base
   # TODO: needs a method to find current season?
   # TODO: need ordering in display
   
	hobo_model # Don't put anything above this

	fields do
		year :integer, :required, :unique
		timestamps
	end

	has_many :thresholds

	## Permissions:
	# XXX: seasons can only be created by adminstrators. Seem right?
	
	def create_permitted?
		acting_user.administrator?
	end

	def update_permitted?
		acting_user.administrator?
	end

	def destroy_permitted?
		acting_user.administrator?
	end

	def view_permitted?(field)
		true
	end
	
	## Accessors:
	
	# Return the name of the season.
	#
	# This will be based on the starting year.
	#
	def name
		return "#{year} season"
	end
	
	# What is the first day of the season?
	#
	# Currently we assume this is the first day of the year.
	#
	def start_date
		return Date.new(y=year, m=1, d=1)
	end

	# What is the last day of the season?
	#
	# Currently we assume this is the last day of the year.
	#	
	def stop_date
		return Date.new(y=year, m=12, d=31)
	end
	
	# Does a day fall within this season?
	#
	# We judge this based on the first and last days of a season.
	#
	def date_within(d)
      return (start_date <= d) && (d <= stop_date)
	end

	# Fetch the current season.
	#
	def self.find_current_season
      current_year = Date.now.year
      return year_is(current_year)
	end
	
end
