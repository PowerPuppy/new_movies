class NewMovies::CLI
  def call
    puts "Welcome movie fan!"
    puts "Please select a movie you would like to find out more about."
    get_movies
    get_user_selection

  end

  def get_movies
      #to be scraped
      @movies = ["It Chapter Two (2019)",
        "Hustlers",
        "The Goldfinch",
        "Ad Astra",
        "Abominable (2019)",
        "Gemini Man",
        "Joker (2019)",
        "The Addams Family (2019)"]
  end

  def get_user_selection
    #list movies
    @movies.each_with_index do |movie, index|
        puts "#{index+1}. #{movie}"
      end

  end
end
