# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.6.3'

gem 'activesupport', ">= 5.2.4.3"
gem 'bcrypt'
gem 'bootsnap', '>= 1.1.0', require: false
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
gem 'jwt'
gem 'json', ">= 2.3.0"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'devise-jwt'
gem 'mysql2'
gem "rack", ">= 2.1.4"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  gem 'listen'
  gem 'rename'
  gem 'rspec-rails'
  gem 'rubocop'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rubocop-faker'
  gem 'rubocop-rspec'
  gem 'shoulda-matchers'
end
