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
    @movies.each.with_index(1) do |movie, index|
        puts "#{index}. #{movie}"
      end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the movie you'd like more info on or type exit"
      input = gets.strip.downcase
      #logic of dealing with users input
      if input.to_i > 0
        puts @movies[input.to_i - 1].title
        puts @movies[input.to_i - 1].synopsis
      elsif input == "list"
          list_movies
      elsif input > @movies.count
        puts "Not sure what you want, type list or exit"
      else
        puts "Not sure what you want, type list or exit"
      end
    end
  end

end
