# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Chinese::Application.config.secret_token = ENV['SECRET_TOKEN']
Chinese::Application.config.secret_key_base = 'e66223d97ee1ddedd6352d35db639cbe80e8883697125ae09dfca3ea5dddee63d461a29846c5019f75608c368c73d05790fac40a332d11b2a9936a8c5d0fadf4'
