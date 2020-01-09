require 'bundler'
require 'nokogiri'
require 'open-uri'
require_relative '../app/models/scraper'

Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)

require_all 'app'
