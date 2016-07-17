

class Movie
 
  def initialize(movie)

    @link = movie.link
    @title = movie.title
    @year = movie.year
    @country = movie.country
    @genre = movie.genre
    @length = movie.length.to_i
    @rating = movie.rating
    @director = movie.director
    @actors = movie.actors
    @date = 
      case movie.date.length
        when 4
          nil
        when 7
          Date.strptime(movie.date, "%Y-%m")
        else
          Date.strptime(movie.date, "%Y-%m-%d")        
      end
  end

  attr_reader :link, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors

  def show
    puts "My title is #{@title}"
  end


  def has_genre?(genre)
    @genre.include?(genre)
  end


  def to_s
      "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}" 
  end

end