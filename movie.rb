
class Movie
 
 attr_reader :url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors
 
  def initialize(row)
    @url = row[0]
    @title = row[1]
    @year = row[2]
    @country = row[3]
    @date = row[4]
    @genre = row[5].to_s
    @length = row[6].to_i
    @rating = row[7]
    @director = row[8]
    @actors = row[9]
  end

  def has_genre?(genre)
      @genre.include?(genre)
  end

  def to_s
      "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actors}" 
  end
end
