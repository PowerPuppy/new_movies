class NewMovies::CLI
  def call
    puts "\nWelcome movie fan!\n"
    NewMovies::Scraper.new.get_movies
    menu
  end


  def list_movies
    #list movies
    puts "Please select a movie you would like to find out more about."
    @movies.each_with_index do |movie, index|
        puts "#{index+1}. #{movie}"
      end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the movie you'd like more info on or type exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Info on 1"
      when "2"
        puts "info on 2"
      when "list"
        list_movies
      end
    end
  end
end
