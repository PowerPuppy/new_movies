class NewMovies::Movie
  attr_accessor :title, :synopsis, :url

  @@all = Array.new
  def self.today
    self.scrape_movies
  end

  def initialize(url, title)
    @url = url
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def scrape_details
    @synopsis = NewMovies::Scraper.scrape_synopsis(@url)
  end

  def self.find_by_word(word)
     self.all.select do |movie|
       binding.pry
       movie.title.downcase.includes? word.downcase
     end
   end

end
