source 'https://rubygems.org'

gem 'rails', '4.1.14.1'
gem 'rake', '= 0.9.6'
gem 'rack', '= 1.5.2'

group :development, :test do
  gem 'sqlite3'
  gem 'minitest'
  gem 'thor'
end

group :production, :mysql do
  gem 'mysql2', '~> 0.3.20' #version >= 4.0.0 is not compatible with this rails version
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
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development

# assets pipeline
source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap-sass-official'
end

# project related gems
gem 'puma'
gem 'slim-rails'
gem 'will_paginate'

gem 'non-stupid-digest-assets'
gem 'quiet_assets'

gem 'faker'

gem 'geocoder'
gem 'maxminddb'

gem 'gon'

gem 'rolify'
gem 'cancancan'

#devise
gem 'devise'
gem 'omniauth'
# gem 'omniauth-facebook'
gem "omniauth-google-oauth2"


