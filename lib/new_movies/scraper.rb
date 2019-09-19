class NewMovies::Scraper
  require 'nokogiri'
  require 'open-uri'
  attr_accessor :movies
  site = "https://www.fandango.com/"
  doc = Nokogiri::HTML(open(site))
  movies = Array.new
  list = doc.css("li.media")

  def get_movies
    list.each do |movie|
      title = movie.css("a.heading-style-1").text
      url = movie.css("a")[0].attributes["href"]
      movies << title
    end
  end


end
