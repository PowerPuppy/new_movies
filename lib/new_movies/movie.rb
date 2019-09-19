class NewMovies::Movie
  attr_accessor :title, :synopsis, :url

  @@all = Array.new
  def today
    self.scrape_movies
  end

  def scrape_movies
    scrape_fandango
  end

  def scrape_fandango
    site = "https://www.fandango.com"
    doc = Nokogiri::HTML(open(site))
    list = doc.css("li.media")
    list.each do |movie|
      binding.pry
      new_movie = NewMovies::Movie.new
      new_movie.url = movie.css("a")[0].attributes["href"].value
      new_movie.title = movie.css("a.heading-style-1").text
    end
  end

  def scrape_movie_details
      doc = Nokogiri::HTML(open(@url))
      @synopsis = doc.css("p.mop__synopsis-content").text
  end

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
