source 'https://rubygems.org'

gem 'rails', '4.1.15'
gem 'rake', '= 0.9.6'
gem 'rack', '= 1.5.2'

group :development, :test do
  gem 'sqlite3'
  gem 'minitest'
  gem 'thor'
  gem 'faker'
  gem "better_errors"
  gem 'binding_of_caller'
end

# we don't need mysql
#group :production, :mysql do
#  gem 'mysql2', '~> 0.3.20' #version >= 4.0.0 is not compatible with this rails version
#end

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

gem "ember-cli-rails", git: 'https://github.com/ipepe/ember-cli-rails.git'
gem "ember-cli-rails-assets", git: 'https://github.com/ipepe/ember-cli-rails-assets.git'
gem "html_page", git: "https://github.com/ipepe/html_page.git"

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
gem 'devise', '< 4.0.0'
gem 'omniauth'
gem "omniauth-google-oauth2"


gem 'yaml_db'
#rake db:data:dump   ->   Dump contents of Rails database to db/data.yml
#rake db:data:load   ->   Load contents of db/data.yml into the database
