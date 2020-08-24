require "csv"
# Item.create(id:1, title:"macbook", price:100000, text:"中古です。", stock:1, brand:"apple", condition:"新品に近い")

# カテゴリー
CSV.foreach("db/csv/categories-table.csv") do |row|
  Category.create!( name: row[1], ancestry: row[2] )
end

# 送料
CSV.foreach("db/csv/deliveries-table.csv") do |row|
  Delivery.create!( name: row[1], size: row[2], price: row[3] )
end

# ユーザー
CSV.foreach("db/csv/users-table.csv") do |row|
  User.create!( name: row[1], email: row[2], password: row[3], password_confirmation: row[4] )
end

# 住所
CSV.foreach("db/csv/addresses-table.csv") do |row|
  Address.create!( zipcode: row[1], area: row[2], city: row[3], street: row[4], user_id: row[5] )
end

CSV.foreach("db/csv/profiles-table.csv") do |row|
  Profile.create!( text: row[1], image: File.open("./public/images/default.png"), user_id: row[3] )
end
