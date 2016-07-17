

require_relative 'movielist.rb'


filename = "movies.txt"
output = MoviesList.new(filename) 

puts
puts output.sort_by("country") # сортировка по заданному полю


puts
puts output.by_genre("Comedy") # фильмы определенного жанра, отсортированные по дате

puts
puts output.except_genre("Sci-Fi") #фильмы за исключением определенного жанра, отсортированные по дате

puts
puts output.by_country ("USA") #снятые в одной стране

puts
puts output.except_country ("Germany") # исключение страны

puts
puts output.count_by_actors #количество фильмов по каждому актеру

puts
puts output.count_by_directors #по режиссерам

puts
puts output.by_day #по дням

puts
puts output.by_month #по месяцам

puts
puts output.by_year #по годам
