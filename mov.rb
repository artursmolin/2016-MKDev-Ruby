

require_relative 'movielist.rb'
require_relative 'movie.rb'


filename = "movies.txt"
films = MoviesCollection.new(filename) 


puts
puts films.all.first(5) # весь массив

puts
puts films.sort_by(:title).first(5) # сортировка по заданному полю

puts 
puts films.filter(genre: 'Comedy', year: '1959') # фильмы определенного жанра + сортировка по стране

puts
puts films.except_genre('Comedy').first(5) #фильмы за исключением определенного жанра, отсортированные по дате

puts 
puts films.stats(:actors) 

