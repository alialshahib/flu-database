

# A mixin for common methods for the main database objects.
#
# The main (primary) database objects share several fields and their associated
# methods (identifier, description, name). For efficacy, they are gathered here.
#
module PrimaryObjModel

	# --- Permissions --- #
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
	
	
	# --- Associations --- #
	def contains_list_of (association_id, options={})
		defaults = {
			:accessible => true,
			:dependent => :destroy
		}.update(options)
		has_many(association_id, defaults)
	end
	
	def belongs_to_list_in(association_id, options={})
		belongs_to(association_id, options)
	end
	
	# Automagically make set up correct relationships with collection table.
	#
	def is_collectable()
		item_name = table_name
		collection_table = "#{item_name}collections"
		through_table = "#{collection_table}_#{item_name}s".to_sym()
		has_many(collection_table.to_sym(), :through=>through_table)
		has_many(through_table, :dependent=>:destroy)
	end
	
	def is_collection()
		item_name = classname.split.downcase()
		collection_table = "#{name}collections"
		through_table = "#{collection_table}_#{item_name}".to_sym()
		has_many(item_name, :through=>through_table, :accessible=>true)
		has_many(through_table, :dependent=>:destroy)
	end
		
	# --- Naming & identifiers --- #
	def source_id
		return "#{source.blank? ? '' : source + ':'}#{identifier}"
	end
	
	# Deliver a printable user-friendly name
	#
	# The scheme we use is this:
	# - the record must have an identifier, but need not have a source or title
	# - if there is a source, a src_id is produced from "source:identifier"
	# - else, the src_id is just the id
	# - if there is no title, or if the title equals the src_id, the name is
	#   just the src_id
	# - otherwise the name is "title (src_id)"
	#
	# So for these src / identifier / title triplets, we get the names:
	# - foo / bar / baz -> "baz (foo:bar)"
	# - / bar / baz -> "baz (bar)"
	# - / bar / bar -> "bar"
	# - bar / bar / bar -> "bar (bar:bar)"
	# - / bar / -> "bar"
	#	
	def name
		src_id = source_id()
		if not title.blank?
			if title == src_id
				return title
			else
				return "#{title} (#{src_id})"
			end
		else
			return src_id
		end
	end
	
	# A terse form of name where it is needed
	def short_name
		return title || source_id()
	end
	
	
	
	protected
	
		# You can't set dynamic defaults for rails, and normalisation needs to be
		# done before any validation. So we do it all here.
		#
		def clean_identifier(raw_id)
			if (raw_id.blank?)
				return generate_uid(prefix="bseq")
			else
				return identifier.strip()	
			end
		end
		
		def clean_title(raw_val)
			return raw_val.strip()	
		end
				
		def clean_source(raw_val)
			return raw_val.strip()	
		end
				
		def clean_description(raw_val)
			return raw_val.strip()	
		end
	
end
