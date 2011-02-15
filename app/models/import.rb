class Import
 attr_accessor :file, :dry_run
 attr_reader :encoding, :imported

 def initialize(params={})
   @dry_run = true
   params.each do |key, value|
     send("#{key}=", value)
   end

   # TODO: Allow user-specified encodings
   @encoding = "windows-1252"
 end

 def new_record?
   true
 end

 def dry_run=(value)
   case value
   when "1", 1, true
     @dry_run = true
   else
     @dry_run = false
   end
 end

 def errors
   @errors ||= ActiveRecord::Errors.new(self)
 end

 def validate
   errors.clear
   errors.add_on_blank(:file)
   return if @file.blank?

   errors.add(:file, "must be a ZIP file") unless
File.extname(@file.original_filename).downcase == ".zip"
   errors.add(:file, "must not be empty") if
File.size(@file.path).zero?
   return unless errors.empty?

   errors.add_to_base("dry-run specified: not importing") if @dry_run

   # more validations
 end

 def valid?
   validate
   errors.empty?
 end

 def save
   return false unless valid?
   # import
   true
 end

 #
 # The next 3 methods are for ActiveRecord::Errors
 #

 def self.human_name
   self.name
 end

 def self.human_attribute_name(attribute_name)
   attribute_name.to_s.humanize
 end

 def self.self_and_descendants_from_active_record
   [self]
 end

 #
 # The following 20 or 30 methods are to support Hobo/ActiveRecord
 #

 def self.has_lifecycle?
   false
 end

 def self.view_hints
   class_name = "#{name}Hints"
   class_name.safe_constantize or Object.class_eval("class
   #{class_name} < Hobo::ViewHints; end; #{class_name}")
 end

 Column = Struct.new(:name, :type, :default)

 def self.columns
   [Column.new("id", :integer, nil), Column.new("file", :string, nil), Column.new("dry_run", :boolean, true)]
 end

 def self.content_columns
   columns.select {|column| %w(file dry_run).include?(column.name)}
 end

 def self.column_names
   columns.map(&:name)
 end

 def self.attr_protected(*args)
   # ignored
 end

 def self.column(name)
   columns.detect {|column| column.name == name}
 end

 def self.never_show?(*args)
   false
 end

 def self.creator_attribute
   :creator_attribute
 end

 def self.primary_content_attribute
   :primary_content_attribute
 end

 def self.attr_order
   [:file, :dry_run]
 end

 def self.reflections
   Hash.new
 end

 def self.name_attribute
   :name_attribute
 end

 def self.user_new(*args)
   new(*args[1..-1])
 end

 def self.to_url_path
   "#{name.underscore.pluralize}"
 end

 def to_url_path
   "#{self.class.to_url_path}/#{to_param}" unless new_record?
 end

 def self.typed_id
   HoboFields.to_name(self) || name.underscore.gsub("/", "__")
 end

 def typed_id
   "#{self.class.name.underscore}:#{self.id}" if id
 end

 def creatable_by?(user)
   true
 end

 def editable_by?(user, field=nil)
   true
 end
end

