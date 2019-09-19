class NewMovies::Movie
  attr_accessor :title, :synopsis
  @@all = []

  def initialzie(title, synopsis)
    @title = title
    @synopsis = synopsis
    @@all << self
  end

  end
  def self.all
    @@all
  end
end
