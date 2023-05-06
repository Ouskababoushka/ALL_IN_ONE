# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

ResultItem.destroy_all
User.destroy_all

seed = []
10.times do
  hosted_website = ["facebook marketplace", "leboncoin", "geev"].sample
  result_item = ResultItem.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 0..1000.0, as_string: false),
    currency: "EUR",
    image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['product']),
    posted_at: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    item_type: ["fridge", "bed", "car"].sample,
    city: Faker::Address.city,
    hosted_website: hosted_website,
    hosted_url: "https://www.#{hosted_website.downcase.split(' ')[0]}.com"
  )
  seed << result_item
end

User.create!(email: "dummy@example.com", password: "password")
