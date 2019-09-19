class NewMovies::Scraper
  require 'nokogiri'
  require 'open-uri'
  attr_accessor :movies
  site = "https://www.fandango.com/"
  doc = Nokogiri::HTML(open(site))
  urls = Array.new
  list = doc.css("li.media")

  def todays_movies
    get_url
    make_movies_from_url
  end

  def get_url
    list.each do |movie|
      url = movie.css("a")[0].attributes["href"]
      urls << url
    end
  end

def make_movies_from_url
  urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    NewMovies::Movie.new
    title: = doc.css("h1").text
    synopsis: = synopsis = doc.css("p.mop__synopsis-content").text
end
