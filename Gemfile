source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.13'
gem 'rails-api'

group :development, :test do
  gem 'debugger'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

group :assets do
  gem 'jquery-rails', '~> 2.2'
  gem 'sass-rails', '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'compass-rails'
  gem 'uglifier'
  gem 'bootstrap-sass', '~> 2.0.3.0'
end

group :development do
  gem 'quiet_assets'
end

gem 'devise'                   # server-side authentication
gem 'bcrypt-ruby'              # password encryption

gem 'ember-rails'
gem 'ember-source', '1.0.0rc3.3'

gem 'active_model_serializers'

gem 'ember-auth-rails'
gem 'ember-auth-source', '~> 6.0'

gem 'unicorn'

# workaround https://github.com/emberjs/ember-rails/issues/168
gem 'handlebars-source', '1.0.0.rc3'
