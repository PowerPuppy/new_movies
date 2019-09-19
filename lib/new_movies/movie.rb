class NewMovies::Movie
  attr_accessor :title, :url, :run_time :rating

  def today
    #Scrape fandango and return movies based on that data
    self.scrape_movies
  end

  def self.scrape_movies

  end

end
