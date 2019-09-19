require_relative "new_movies/version"
require_relative "new_movies/cli"
require_relative "new_movies/scraper"
require_relative "new_movies/movie"
require 'pry'
require 'nokogiri'
require 'open-uri'

module NewMovies
  class Error < StandardError; end
  # Your code goes here...
end
