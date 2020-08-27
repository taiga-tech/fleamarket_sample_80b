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
  User.create!( name: row[1], family_name: row[2], first_name: row[3], family_name_kana: row[4], first_name_kana: row[5], birthday: row[6], email: row[7], password: row[8], password_confirmation: row[9] )
end

# 住所
CSV.foreach("db/csv/addresses-table.csv") do |row|
  Address.create!( family_name: row[1], first_name: row[2], family_name_kana: row[3], first_name_kana: row[4], zipcode: row[5], area: row[6], city: row[7], street: row[8], user_id: row[9] )
end

CSV.foreach("db/csv/profiles-table.csv") do |row|
  Profile.create!( text: row[1], image: File.open("./public/images/default.png"), user_id: row[3] )
end
