class NewMovies::CLI
  attr_accessor :movies
  def call
    puts "\nWelcome movie fan!\n"
    list_movies
    menu
  end

  def list_movies
    #list movies
    puts "Please select a movie you would like to find out more about."
    NewMovies::Movie.new.today
    @movies = NewMovies::Movie.all
    @movies = @movies.drop(1)
    @movies.each.with_index(1) do |movie, index|
        puts "#{index}. #{movie.title}"
      end
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the movie you'd like more info on or type list, type or exit\n"
      input = gets.strip.downcase
      #logic of dealing with users input
      if input.to_i > @movies.count

      elsif input.to_i > 0
        puts @movies[input.to_i - 1].title
        @movies[input.to_i - 1].scrape_details
        puts "Synopsis:"
        puts @movies[input.to_i - 1].synopsis
      elsif input == "list"
        puts "Please select a movie you would like to find out more about."
        @movies.each.with_index(1) do |movie, index|
            puts "#{index}. #{movie.title}"
          end
      end
    end
  end

end
