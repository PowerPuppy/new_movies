class NewMovies::Scraper
  def self.scrape_movies
    site = "https://www.fandango.com"
    doc = Nokogiri::HTML(open(site))
    list = doc.css("section.footer-coming-soon a.footer-coming-soon--heading")
    list.each do |movie|
      url = movie.attributes["href"].value
      title = movie.text
      NewMovies::Movie.new(url, title) if title
    end
  end

  def self.scrape_synopsis(url)
      doc = Nokogiri::HTML(open(url))
      synopsis = doc.css("p.mop__synopsis-content").text.chomp
  end

end
