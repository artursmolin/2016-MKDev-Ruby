

require_relative 'movielist.rb'
require_relative 'movie.rb'


filename = "movies.txt"
output = MoviesList.new(filename) 


puts
puts output.all # весь массив

puts
puts output.sort_by("genre") # сортировка по заданному полю

puts 
puts output.filter("Comedy", "USA") # фильмы определенного жанра + сортировка по стране

puts
puts output.except_genre("Drama") #фильмы за исключением определенного жанра, отсортированные по дате

puts
puts output.stats("date") # кол-во фильмов по запрашеваемому полю

