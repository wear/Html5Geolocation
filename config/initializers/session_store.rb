# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bill_session',
  :secret      => '4b0255f16f6e6842bbe428778ecb03db50ec9eafacd6f674e061635e45740e69fcf8ee181a9b1e9235d6e663a6f3478049bf571fb8c37d66c8d90b59a54bc571'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
