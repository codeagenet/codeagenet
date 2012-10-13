source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'pg'

gem 'jquery-rails'

gem 'devise'
gem 'omniauth'
gem 'oauth2'
gem 'omniauth-github'
gem 'unicorn'

gem 'resque'
gem 'resque-scheduler', :require => 'resque_scheduler'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  #fabrications
  gem 'ffaker'
  gem 'fabrication'
  gem 'thin'

  #debugger
  gem 'pry'
  gem 'pry-nav'

	gem 'rspec-rails'
  gem 'shoulda', :require => false
  gem 'accept_values_for'

  gem 'letter_opener'
  #cleaner dev server log
  gem 'quiet_assets'

  gem 'simple-rails-deploy'
end
