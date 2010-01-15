# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twitter_gift_session',
  :secret      => 'd51a160deaed1c0659f94abea9e0ff62cbdd0d24f7b19269ae11b93d8878cecc647c04e4f796d29ee51ecda61ef8ebc0a25c085494b2a4007f78d5b49133e2cb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
