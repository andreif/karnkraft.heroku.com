source 'http://rubygems.org'

# gem 'mongrel', '>= 1.2.0.pre2'
# gem 'unicorn'
gem 'thin'#, group:[:production]
gem 'foreman', :group => :development

gem 'rails', '>= 3.1.0.rc8'
gem 'sass-rails', ">= 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'

gem 'haml', '>= 3.1.1'
gem 'haml-rails', '>= 0.3.4', :group => :development
# gem 'formtastic'

gem 'sqlite3', group:[:development, :test]
gem 'pg', group:[:production]
gem 'mongoid', '>= 2.0.2'
gem 'bson_ext', '>= 1.3.1'
gem 'mongoid_auto_inc'

gem 'nokogiri'
gem 'hpricot'

# Authentication and Authorization
# gem "devise", ">= 1.4.2"
# gem "omniauth", '>= 0.2.6'
# gem 'oa-openid', :require => 'omniauth/openid'
# gem 'cancan'

# gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'

group :development, :test do
  gem 'rspec-rails', '>= 2.6.1'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-bundler'
  gem 'spork', '>= 0.9.0.rc9'
  gem 'guard-spork'
  gem 'simplecov'
  #if RUBY_PLATFORM.downcase.include?("darwin")
    gem 'rb-fsevent'
    gem 'growl' # don't forget to install growlnotify - it's in Growl-*.dmg/Extras/growlnotify/growlnotify.pkg
  #end
end

group :test do
  gem 'database_cleaner', '>= 0.6.7'
  gem 'mongoid-rspec', '>= 1.4.4'
  gem 'factory_girl_rails', '>= 1.1.rc1'
  gem 'cucumber-rails', '>= 1.0.2' # cannot run with capybara webkit due to dependency problems
  gem 'capybara', '>= 1.0.0'
  gem 'capybara-webkit', git: 'git://github.com/thoughtbot/capybara-webkit.git' # otherwise there are issues with dependencies
  #gem "launchy", ">= 0.4.0" # capybara depends on
  gem 'shoulda-matchers'
end
