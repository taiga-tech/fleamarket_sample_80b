# フリマ DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :auctions
- has_many :purchases   

## auctionsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false| 
|price|integer|null: false| 
|image|string|null: false|
|text|text|null: false| 
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :purchases
- has_many :auctions_categories
- has_many :categories,  through:  :actions_categories
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :auctions_categories
- has_many :auctions,  through:  :auctions_categories
## auctions_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|auction_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :auction
- belongs_to :category 
- belongs_to :purchase
## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false| 
|price|integer 
|user_id|integer|null: false, foreign_key: true|
|auction_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :auction 
- belongs_to :user  
- has_many :auctions_categories
- has_many  :categories,  through:  :actions_categories