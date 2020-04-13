# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'nokogiri'

Movie.destroy_all

puts "creating"

url = 'https://en.wikipedia.org/wiki/List_of_highest-grossing_non-English_films'
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
movie = []
num = 1

html_doc.search("tbody tr")[1..8].each do |element|

  url2 = "http://www.omdbapi.com/?apikey=fb36b2dd&t=#{element.search("td[2]").text.strip}"
  html_file2 = open(url2).read
  movie_api = JSON.parse(html_file2)
  movie[num] = Movie.create!(
    title: element.search("td[2]").text.strip,
    year: element.search("td[7]").text.strip.to_i,
    plot: movie_api["Plot"]
    )
  file = URI.open("#{movie_api["Poster"]}")
  movie[num].photo.attach(io: file, filename: 'parasaite.jpg', content_type: 'image/jpg')
  num += 1
end

puts "finish"
