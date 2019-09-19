class NewMovies::Movie
  attr_accessor :title, :synopsis

  def title
    @title
  end
  @@all = Array.new
  def today
    self.scrape_movies

  end

  def scrape_movies

    @@all << self.scrape_fandango
  end

  def scrape_fandango
    site = "https://www.fandango.com"
    doc = Nokogiri::HTML(open(site))
    urls = Array.new
    list = doc.css("li.media")
    list.each do |movie|
      url = movie.css("a")[0].attributes["href"]
      urls << url
    end

    urls.each do |url|
      doc = Nokogiri::HTML(open(url))

      movie = NewMovies::Movie.new
      movie.title = doc.css("h1").text
      movie.synopsis = synopsis = doc.css("p.mop__synopsis-content").text
      end
  end

  def self.all
    @@all
  end
end
