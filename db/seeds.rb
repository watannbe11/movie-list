# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
Movie.destroy_all

puts "creating"

movie1 = Movie.create!(
  title: "parasite",
  year: 2019
  )
file = URI.open('https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_UY1200_CR90,0,630,1200_AL_.jpg')
movie1.photo.attach(io: file, filename: 'parasaite.jpg', content_type: 'image/jpg')

 movie2 = Movie.create!(
  title: "Grand Hotel",
  year: 1933
  )
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/d/d6/GrandHotelFilmPoster.jpg')
movie2.photo.attach(io: file, filename: 'grandhotel.jpg', content_type: 'image/jpg')


movie3 = Movie.create!(
  title: "The Lobster",
  year: 2015
)
file = URI.open('https://m.media-amazon.com/images/M/MV5BNDQ1NDE5NzQ1NF5BMl5BanBnXkFtZTgwNzA5OTM2NTE@._V1_.jpg')
movie3.photo.attach(io: file, filename: 'lobster.jpg', content_type: 'image/jpg')

movie4 = Movie.create!(
  title: "The Wandering Earth",
  year: 2019
)
file = URI.open('https://upload.wikimedia.org/wikipedia/en/1/1b/The_Wandering_Earth_film_poster.jpg')
movie4.photo.attach(io: file, filename: 'wonder.jpg', content_type: 'image/jpg')


puts "finish"
