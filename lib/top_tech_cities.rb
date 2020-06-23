require_relative "top_tech_cities/version"
require_relative "top_tech_cities/Cli"
require_relative "top_tech_cities/scraper"
require_relative "top_tech_cities/city"

require 'pry'
require 'nokogiri'
require 'open-uri'
require "colorize"

module TopTechCities
  class Error < StandardError; end
  # Your code goes here...
end
