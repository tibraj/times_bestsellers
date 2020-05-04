require_relative "./times_bestsellers/version"
require_relative "./times_bestsellers/cli"
require_relative "./times_bestsellers/novel"
require_relative "./times_bestsellers/scraper"

require 'pry'
require 'nokogiri'
require 'open-uri'


module TimesBestsellers
  class Error < StandardError; end
  # Your code goes here...
end
