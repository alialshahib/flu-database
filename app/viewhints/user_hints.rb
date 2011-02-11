
# Presentation details for the User class
#
# Basically we want to display the user all with things like what countries
# they can edit for etc.
#
class UserHints < Hobo::ViewHints
   # TODO: do these appear on the signup form or just the editting form?
      
   field_help(
      :name => "The identity of the user",
      :user_name => "A unique identifier for the user",
      :email_address => "The user's email address, required for sending
         password reminders, etc.",
      :country => "What country or region the user belongs to and has access
         privileges for."
   )

end
