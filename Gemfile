source 'https://rubygems.org/'

ruby "2.2.3"

gem 'rails', '4.2.6'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'devise'
gem 'foundation-rails'
gem 'carrierwave'
gem 'redcarpet'
gem 'rouge'
gem 'capybara-webkit'
gem 'font-awesome-rails'

group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails'
  gem 'shoulda'
  gem 'valid_attribute'
  gem 'quiet_assets'
  gem 'dotenv-rails'
end

group :test do
  gem 'launchy', require: false
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'orderly'
end

group :production do
  gem 'rails_12factor'
  gem 'fog'
end
