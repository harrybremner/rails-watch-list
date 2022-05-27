require 'open-uri'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


url = "https://tmdb.lewagon.com/movie/top_rated"
attempt_serialized = URI.open(url).read
result = JSON.parse(attempt_serialized)["results"]

puts "Cleaning database..."
Movie.destroy_all

puts "Creating movies..."

result.each do |result|
  movie = Movie.create(title: result["original_title"], overview: result["overview"], poster_url: result["poster_path"], rating: result["popularity"])
  puts "Movie with id: #{movie.id} has been created"
end
puts "Finished!"


# 10.times do
#   movie = Movie.create!(title: Faker::Movie.title, overview: Faker::Movie.quote, poster_url: "https://image.tmdb.org/t/p/w500/#{result["results"][0]["poster_path"]}")
#   puts "Movie with id: #{movie.id} has been created"
# end
# puts "Finished!"
