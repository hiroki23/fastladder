source 'https://rubygems.org'
gem 'rails', '5.1.3'

# Include database gems for the adapters found in the database
# configuration file or DATABASE_URL
require 'erb'
require 'uri'
require 'yaml'

database_file = File.join(File.dirname(__FILE__), "config/database.yml")
adapters = []

if File.exist?(database_file)
  database_config = YAML::load(ERB.new(IO.read(database_file)).result)
  adapters += database_config.values.map {|conf| conf['adapter']}.compact.uniq
end

if database_url = ENV['DATABASE_URL']
  adapters << URI.parse(database_url).scheme
end

if adapters.any?
  adapters.each do |adapter|
    case adapter
    when 'mysql2'     ; gem 'mysql2'
    when 'mysql'      ; gem 'mysql'
    when /postgres/   ; gem 'pg'
    when /sqlite3/    ; gem 'sqlite3'
    else
      warn("Unknown database adapter `#{adapter}` found in config/database.yml, use Gemfile.local to load your own database gems")
    end
  end
else
  warn("No adapter found in config/database.yml or DATABASE_URL, please configure it first -- fallback to pg")
  gem 'pg'
end

gem 'addressable', require: 'addressable/uri'
gem 'coffee-rails'
gem 'feed_searcher'
gem 'feedjira'
gem 'haml'
gem 'slim'
gem 'i18n-js'
gem 'jbuilder'
gem 'jquery-rails'
gem 'mini_magick'
gem 'nokogiri'
gem 'opml', git: 'https://github.com/hiroki23/opml'
gem 'sass-rails'
gem 'settingslogic'
gem 'uglifier'

if ENV['NEW_RELIC_LICENSE_KEY']
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'pry-byebug'
#  gem 'rubocop'
end

group :development do
  gem 'annotate'
  gem 'pry-rails'
  gem 'pry-doc'

  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-rubocop'
  gem 'listen'
end

group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'factory_girl_rails'
#  gem 'konacha'
  gem 'launchy'
  gem 'poltergeist'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'simplecov-rcov'
  gem 'sinon-rails'
  gem 'puma'
  gem 'webmock'
  gem 'rails-controller-testing'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
