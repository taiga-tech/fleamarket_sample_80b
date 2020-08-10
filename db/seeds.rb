require "csv"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Item.create(id:1, title:"macbook", price:100000, text:"中古です。", stock:1, brand:"apple", condition:"新品に近い")

# カテゴリー
CSV.foreach("db/csv/categories-table.csv") do |row|
  Category.create!(name: row[1])
end

# 送料
CSV.foreach("db/csv/deliveries-table.csv") do |row|
  Delivery.create!(name: row[1], size: row[2], price: row[3])
end

# Item.create!(title: "test10", price: 400, text: "test10", stock: 10, brand: "test3", condition: "test10",leadtime: 10, user_id: 10, delivery_id: 10, category_id: 10)
# User.create!(name: "test10", email: "testtest10@test", password: "testtest10", password_confirmation: "testtest10")

