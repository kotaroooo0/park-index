source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# default
gem 'rails', '~> 5.1.2'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# for fontend
gem 'bootstrap', '~> 4.0.0'
gem 'bootstrap-social-rails'
gem 'jquery-rails'
gem 'font-awesome-rails'
gem 'slim-rails'

# for login
gem 'config'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-instagram'

# for scraping
gem 'mechanize'

# for model
gem 'annotate'
gem 'active_hash'

# for paginate
gem 'kaminari'
gem 'kaminari-bootstrap'

# for upload image
gem 'carrierwave'
gem 'rmagick', require: 'RMagick'

group :production do
  gem 'pg', '0.20.0'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem "rspec-rails"
  gem "faker"
  gem "factory_bot_rails"
  gem "guard-rspec"
  gem "spring-commands-rspec"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
