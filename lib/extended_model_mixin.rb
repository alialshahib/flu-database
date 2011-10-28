
### IMPORTS

require('dev_tools')
require('rails_extensions')


### CONSTANTS & DEFINES

### IMPLEMENTATION

# A mixin for common methods for the main database objects.
#
# To simplify development, a number of methods are added to the basic hobo
# model.
#
module ExtendedModelMixin

	## Permissions:
	# So as to simply the assigning of permissions, we devolve them to two
	# questions: can they be read (viewed)? can they be written (changed)?
	# These can be implemented in individual models, or the original methods
	# used, so as to acheive whatever access restriction is required.
	
	def read_permitted?
		true
	end

	def write_permitted?
		true
	end
	
	def create_permitted?
		write_permitted?
	end

	def update_permitted?
		write_permitted?
	end

	def destroy_permitted?
		write_permitted?
	end

	def view_permitted?(field)
		read_permitted?
	end

end


### END ###
