require 'csv'
require 'date'
require 'ostruct'

require_relative 'movie.rb'
KEYS = [:url, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors]

class MoviesCollection 
  
  def initialize(filename)
    @filename = filename
    @movies = CSV.read(filename, col_sep: '|', write_headers: :true, headers: KEYS).
      map{|film| Movie.new(film)}
  end

  def all
    puts @movies.first(5) #all films
  end

  def sort_by (field) # sort by any field
    @movies.
      sort_by {|movie| movie.send(field)}
  end
  
  def filter(filters)
  arr = []
  filters.each do |key, val|
    arr = @movies.select { |movie| movie.send(key) == val }
  end
  arr
  end

  def except_genre (genre)  #delete genre
    @movies.
      select{|movie| !movie.has_genre?(genre)}.
      map{|movie| movie.title + " " + movie.genre.to_s}
  end

  def stats(field)
    if field == "date"
      @movies.map { |movie| (Date.parse(movie.date, '%Y-%m-%d').mon if movie.date.length == 10) }.compact.
        group_by{|i| i}.collect{|month, group| [month, group.count]}.to_h.sort.
        map{ |month, quant| Date::MONTHNAMES[month] + ' - ' + quant.to_s }
    else
      @movies.map{|movie| movie.send(field)}.
       sort_by{|field| field}.group_by{|field| field}.
       map{|field, group| [field, group.count]}
  end
end
end
