

require_relative 'movielist.rb'
require_relative 'movie.rb'


filename = "movies.txt"
films = MoviesCollection.new(filename) 


puts
puts films.all # весь массив

puts
puts films.sort_by("title").first(5) # сортировка по заданному полю

puts 
puts films.filter(year: '1993') # фильмы определенного жанра + сортировка по стране

puts
puts films.except_genre("Sci-Fi").first(5) #фильмы за исключением определенного жанра, отсортированные по дате

puts 
puts films.stats("date").first(5) # кол-во фильмов по запрашеваемому полю

