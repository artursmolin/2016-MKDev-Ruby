
class Movie
 
 attr_reader :url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actor
 
  def initialize(row)
    @url = row[0]
    @title = row[1]
    @year = row[2].to_i
    @country = row[3]
    @date = row[4]
    @genre = row[5].split(',')
    @length = row[6].to_i
    @rating = row[7]
    @director = row[8]
    @actor = row[9].split(',')
  end

  def has_genre?(genre)
      @genre.include?(genre)
  end

  def match?(key, value)
    keyval = self.send(key)
    if keyval.is_a?(Array)
       keyval.any?{|field| value == field}
    else value === keyval
    end
  end

  def to_s
      "#{@title} (#{@year}), #{@genre} - #{@director}; #{@actor}" 
  end
end
