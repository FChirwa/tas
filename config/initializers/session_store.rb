# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tas1_session',
  :secret      => '1622d2ef3f2daf9fa22d86bbf2f96c4352c10276d01603f7b256daa2207f84b3dc628bd9c9a0780cb26f05b2830dc30e297e55ec333be5d1739cff2800cbc07f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
