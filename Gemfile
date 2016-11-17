source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '4.2.7.1'
gem 'rake'
gem 'rack'

group :development, :test do
  gem 'sqlite3'
  gem 'minitest'
  gem 'thor'
  gem 'faker'
  gem "better_errors"
  gem 'binding_of_caller'
  gem 'pry'
end

group :development do
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :production, :postgresql do
  gem 'pg'
end

# classic gems
gem 'sass-rails', '~> 4.0.5'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc


# assets pipeline
source 'https://rails-assets.org' do
  gem 'rails-assets-jquery', '< 3.0.0'
  gem 'rails-assets-bootstrap-sass-official'
  gem 'rails-assets-bootstrap-datepicker'
  gem 'rails-assets-d3', '< 3.6.0'
end

# project related gems
gem 'dotenv-rails'
gem 'puma'
gem 'slim-rails'
gem 'will_paginate'

gem 'non-stupid-digest-assets'
gem 'quiet_assets'

gem 'rufus-scheduler'

gem 'gon'
# gem 'rolify'
# gem 'cancancan'

#devise
gem 'devise'
gem 'omniauth'
gem "omniauth-google-oauth2"


gem 'yaml_db'
#rake db:data:dump   ->   Dump contents of Rails database to db/data.yml
#rake db:data:load   ->   Load contents of db/data.yml into the database
