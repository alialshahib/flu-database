
# A period or interval within which a threshold holds or a report is made
# 
# Seasons begin at the same day every year, so only the year need be recorded.
# 
class Season < ActiveRecord::Base
	# TODO: when does Southern hemisphere season start?
	# TODO: name the seasons better?
	# TODO: year field description

	hobo_model # Don't put anything above this

	fields do
		year :integer, :required, :unique
		timestamps
	end

	has_many :thresholds
	has_many :susceptibilities


	set_default_order "year DESC"

	# when does a season start?
	# TODO: this should really be defined globally
	START_MONTH = 1
	START_DAY = 1

	## Permissions:
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
	def start_date
		return Date.new(y=year, m=START_MONTH, d=START_DAY)
	end

	# What is the last day of the season?
	#
	def stop_date
		#return Date.new(y=year+1, m=START_MONTH, d=START_DAY) - 1
		return start_date.next_year.prev_day()
	end

	# Does a day fall within this season?
	#
	# We judge this based on the first and last days of a season.
	#
	def date_within(d)
		return (start_date <= d) && (d <= stop_date)
	end

	# Return the name of the season.
	#
	# This will be based on the starting year.
	#
	def description
		return "Running from #{start_date} to #{stop_date}"
	end
	
	# Fetch the current season.
	# 
	# Returns: the record that "contains" the current date. If none fits,
	#    return nil
	#
	def self.find_current_season
		# TODO: does this work?
		current_date = Date.now()
		return self.all { |s|
			if s.date_within(current_date)
				return s
			end
		}
		
		return nil
	end

end
