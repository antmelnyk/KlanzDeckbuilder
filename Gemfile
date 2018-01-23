
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

source 'https://rubygems.org'

gem 'rails', '~> 5.0.1'
gem 'puma'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '3.3.6'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'bh', '~> 1.2'

gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-countdown-rails'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'

gem 'figaro'
gem 'kaminari'
gem 'devise', '~> 4.4.0'
gem 'devise-i18n'
gem 'has_scope'
gem 'clipboard-rails'
gem 'image_size'
gem 'webpacker', '~> 3.0'

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pg', '~> 0.18'

  gem 'watir'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :test do
  gem 'minitest'
  gem 'minitest-reporters'
end

group :production do
  gem 'pg', '~> 0.18'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
