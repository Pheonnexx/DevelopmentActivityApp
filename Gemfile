
source 'https://rubygems.org'

gem 'bundler'

#email
gem 'mandrill-api'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem 'execjs'
gem 'therubyracer'

#server thing
gem 'passenger'
#for the use of postgress
gem 'pg'

group :production do
  gem 'rails_12factor'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

#for help with the forms
gem 'cocoon'
gem 'simple_form'

#for help with search functions
gem 'ransack'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

#Gem for login system
gem 'devise'

group :assets do
  gem 'govuk_frontend_toolkit', :git => "https://github.com/alphagov/govuk_frontend_toolkit_gem.git", :submodules => true
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'capybara'
  gem 'factory_girl'
  gem 'relish'
  gem 'seed-fu', '~> 2.3'
  gem 'selenium-webdriver'
  gem 'pry'
  gem 'capybara-webkit'
  gem 'poltergeist'
end

group :development, :test do
  gem 'foreman'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'multi_json', '1.7.8'

gem 'html-proofer'
