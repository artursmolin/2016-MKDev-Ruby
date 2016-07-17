require 'csv'
require 'date'
require 'ostruct'

require_relative 'movie.rb'

KEYS = [:link, :title, :year, :country, :date, :genre, :length, :rating, :director, :actors]



class MoviesList


  def initialize(filename)
    
    @movies = CSV.read(filename, col_sep: '|', headers: KEYS).
    map{|line| OpenStruct.new(line.to_h)}.
    map{|film| Movie.new(film)}
  end
  

  def all
    puts @movies.collect{|movie| movie.date}  #all films
  end

  def sort_by (field) # sort by any field
     @movies.sort_by {|movie| movie.send(field)}.
       map{|movie| movie.to_s + " " + movie.send(field)}
  end


  def by_genre (genre) # sort_by genre
    @movies.
      select{|movie| movie.has_genre?(genre)}.
      map{|movie| movie.title + " " + movie.genre.to_s}
  end


  def except_genre (genre)  #delete genre
    @movies.
      delete_if{|movie| movie.has_genre?(genre)}.
      map{|movie| movie.title + " " + movie.genre.to_s}
  end


  def by_country (country) # single country sort
    @movies.count{|movie| movie.country==country}.to_s
  end

  def except_country (country) #single country delete
    @movies.count{|movie| movie.country!=country}.to_s
  end


  def count_by_directors
    @movies.group_by{|movie| movie.director}. 
      map{|director, group| [director, group.count]}.to_h.sort 
  end


  def count_by_actors
    @movies.map{|movie| movie.actors.chomp.split(",")}.
      flatten.group_by{|i| i}.
      map{|actor, his_movies| [actor, his_movies.count]}.sort
  end


  def by_day
    @movies.collect{|movie| movie.date.day if movie.date!=nil}.
      group_by{|i| i}.collect{|day, group| [day, group.count]}.to_h.
      delete_if{|key, value| key.nil?}.sort.
      map{|day,b| (day.to_s + " - " + b.to_s)}
  end


  def by_month
    @movies.collect{|movie| movie.date.mon if movie.date!=nil}.
      group_by{|i| i}.collect{|month, group| [month, group.count]}.to_h.
      delete_if{|key, value| key.nil?}.sort.
      map{|a,b| (Date::MONTHNAMES[a].to_s + " - " + b.to_s)}
  end


  def by_year
    @movies.collect(&:year).
      group_by{|i| i}.collect{|e, group| [e, group.count]}.to_h.sort.
      map{|a,b| (a.to_s + " => " + b.to_s)}
  end


  


end