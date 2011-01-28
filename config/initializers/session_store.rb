# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_flu_database_session',
  :secret      => '7ba9a0164a7bd2728490f014ebd6f0afae0a2b82b51a91add64df88e6938df9eae8b8f05f94d47ce31c2a94cf7606de8b36200218461c6f037d3e5e303124a8f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
