require 'csv'
require 'date'
require 'ostruct'

require_relative 'movie.rb'

KEYS = [:link, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors]



class MoviesList


  def initialize(filename)
    
    @movies = CSV.read(filename, col_sep: '|', headers: KEYS).
    map{|movie| OpenStruct.new(movie.to_h)}.
    map{|film| Movie.new(film)}
  end


  def all
    puts @movies.first(5) #all films
  end

  def sort_by (field) # sort by any field
     @movies.sort_by {|movie| movie.send(field)}.first(5)
  end

  def filter (genre, country) # sort_by genre
    @movies.
      select{|movie| movie.has_genre?(genre)}.
      select{|movie| movie.country==country}.
      map{|movie| movie.title + " - " + movie.genre.to_s + " - " + movie.country}.first(5)
  end

  def except_genre (genre)  #delete genre
    @movies.
      select{|movie| !movie.has_genre?(genre)}.
      map{|movie| movie.title + " " + movie.genre.to_s}.first(5)
  end

  def stats(field)
    if field == "date"
      @movies.map{|movie| movie.date.mon if movie.date!=nil}.
      group_by{|i| i}.collect{|month, group| [month, group.count]}.to_h.
      delete_if{|key, value| key.nil?}.sort.first(5)
    else
     @movies.map{|movie| movie.send(field)}.
     sort_by{|field| field}.group_by{|field| field}.
     map{|field, group| [field, group.count]}.first(5)
   end
end
end
