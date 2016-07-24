require 'csv'
require 'date'
require 'ostruct'

require_relative 'movie.rb'
KEYS = [:url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actor]

class MoviesCollection 
  
  def initialize(filename)
    @filename = filename
    @movies = CSV.read(filename, col_sep: '|', write_headers: :true, headers: KEYS).
      map{|film| Movie.new(film)}
  end

  def all
    @movies #all films
  end

  def sort_by (field) # sort by any field
    @movies.
      sort_by(&field)
  end

  def filter (filters)
    filters.reduce(@movies) {|filtered, (key, value)| filtered.select{|movies| movies.match?(key, value) }}
  end


  def except_genre (genre)  #delete genre
    @movies.
      select{|movie| !movie.has_genre?(genre)}.
      map{|movie| movie.title + " " + movie.genre.to_s}
  end

  def stats(field)
    if field == :date
      @movies.map { |movie| (Date.parse(movie.date, '%Y-%m-%d').mon if movie.date.length == 10) }.compact.
        group_by{|i| i}.collect{|month, group| [month, group.count]}.to_h.sort.
        map{ |month, quant| Date::MONTHNAMES[month] + ' - ' + quant.to_s }
    else
      @movies.
        map(&field).compact.flatten.
        group_by{|i| i}.
        map {|i, group| [i, group.count]}.sort
  end
end
end
