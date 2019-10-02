class NewMovies::Movie
  attr_accessor :title, :synopsis, :url
  @@all = Array.new

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
       movie.title.downcase.include? word.downcase
     end
   end
end
