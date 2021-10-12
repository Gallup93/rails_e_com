source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'


gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rspec-rails'
gem 'rack-cors'
gem 'fast_jsonapi'
gem 'faraday'

group :development, :test do
  gem 'figaro'
  gem 'pry'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false, group: :test
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rspec-rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
