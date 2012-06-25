source 'http://rubygems.org'

gem 'rails', '3.1.3'
#gem 'twitter-bootstrap-rails'
gem 'bootstrap-sass', '~> 2.0.3'
#gem 'sass-rails', '~> 3.1'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'




# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'capybara'
  gem 'rspec-rails', "~> 2.10.0"
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
  gem 'faker', '0.3.1', :require => false
  gem 'sqlite3'
 # gem 'haml-rails'
  #gem 'hpricot'
  #gem 'ruby_parser'
end

group :test do
	gem 'rspec-rails', "~> 2.10.0"
	gem 'webrat', '0.7.1'
	gem 'factory_girl_rails', '1.0'
  gem 'shoulda-matchers'
end
gem 'jquery-rails'

# To use ActiveModel has_secure_password
 gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :production do
  gem 'pg'
end
