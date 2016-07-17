

class Movie
 
 attr_reader :url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors
 
  def initialize(movie)

    @url = movie.url
    @title = movie.title
    @year = movie.year
    @country = movie.country
    @genre = movie.genre
    @length = movie.length.to_i
    @rating = movie.rating
    @director = movie.director
    @actors = movie.actors.split(',')
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

  

  def has_genre?(genre)
    @genre.include?(genre)
  end
  

  def to_s
      "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}" 
  end

end