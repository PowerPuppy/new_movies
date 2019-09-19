class NewMovies::Scraper
  require 'nokogiri'
  require 'open-uri'
  attr_accessor :urls, :list
  site = "https://www.fandango.com/"
  doc = Nokogiri::HTML(open(site))

  def initialzie
    urls = Array.new
    list = doc.css("li.media")
  end

  def todays_movies
    get_url
    #make_movies_from_url
  end

  def get_url
    list.each do |movie|
      url = movie.css("a")[0].attributes["href"]
      urls << url
      puts urls
    end
  end

def make_movies_from_url
  urls.each do |url|
    doc = Nokogiri::HTML(open(url))

    movie = NewMovies::Movie.new
    movie.title = doc.css("h1").text
    moovie.synopsis = synopsis = doc.css("p.mop__synopsis-content").text
    end
  end

end
