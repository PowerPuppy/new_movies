class NewMovies::Movie
  attr_accessor :title, :synopsis

  @@all = Array.new
  def today
    self.scrape_movies
  end

  def scrape_movies
    scrape_fandango
    scrape_each_movie
  end

  def scrape_fandango
    site = "https://www.fandango.com"
    doc = Nokogiri::HTML(open(site))
    @urls = Array.new
    list = doc.css("li.media")
    list.each do |movie|
      url = movie.css("a")[0].attributes["href"].value
      @urls << url
    end
  end

  def scrape_each_movie
    binding.pry
    @urls.each do |url|
      doc = Nokogiri::HTML(open(url))
      movie = NewMovies::Movie.new
      movie.title = doc.css("h1").text
      movie.synopsis = synopsis = doc.css("p.mop__synopsis-content").text
      end
  end

  def initialzie
    @@all << self
  end

  def self.all
    @@all
  end
end
