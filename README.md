# フリマ DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :sells
- has_many :buys
- has_one :address

## sellsテーブル(出品)
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|price|integer|null: false| 
|image|string|null: false|
|text|text|null: false| 
|brand|string|null: false|
|condition|string|null: false|
|user_id|reference|null: false, foreign_key: true|
|delivery_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :delivery
- has_many :buys
- has_many :sell_categories
- has_many :categories,  through:  :sell_categories

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :sell_categories
- has_many :sells,  through:  :sell_categories

## sell_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|sell_id|integer|null: false, foreign_key: true|
|category_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :sell
- belongs_to :category 
- belongs_to :buy

## buysテーブル(購入)
|Column|Type|Options|
|------|----|-------|
|text|text|null: false| 
|price|integer 
|user_id|reference|null: false, foreign_key: true|
|sell_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :sell 
- belongs_to :user  
- has_many :sell_categories
- has_many  :categories,  through:  :sell_categories

## deliveriesテーブル(配送関係)
|Column|Type|Options|
|------|----|-------|
|area|string|null: false|
|price|integer|null: false|
|leadtime|integer|null: false|
### Association
- has_many :sells

## addressesテーブル(住所)
|Column|Type|Options|
|------|----|-------|
|zipcode|integer|null: false|
|area|string|null: false|
|city|string|null: false|
|street|text|null: false|
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user


