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
    list = doc.css("section.footer-coming-soon a.footer-coming-soon--heading")
    list.each do |movie|
      url = movie.attributes["href"].value
      title = movie.text
      binding.pry
      NewMovies::Movie.new(url, title) if title
    end
  end


  def scrape_details
      doc = Nokogiri::HTML(open(@url))
        @synopsis = doc.css("p.mop__synopsis-content").text.chomp
  end

  def initialize(url, title)
    @url = url
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_word(word)
     self.all.select do |movie|
       binding.pry
       movie.title.downcase.includes? word.downcase
     end
   end

end
