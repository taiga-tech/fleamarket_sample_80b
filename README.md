# フリマ DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :items
- has_many :buys
- has_one :address

## itemsテーブル(商品)
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|price|integer|null: false| 
|text|text|null: false| 
|brand|string|null: false|
|condition|string|null: false|
|user_id|reference|null: false, foreign_key: true|
|delivery_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :delivery
- has_many :buys
- has_many :images
- has_many :item_categories
- has_many :categories,  through:  :item_categories

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :item_categories
- has_many :items,  through:  :item_categories

## item_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|category_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :category 
- belongs_to :buy

## buysテーブル(購入)
|Column|Type|Options|
|------|----|-------|
|text|text|null: false| 
|price|integer 
|user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :item 
- belongs_to :user  
- has_many :item_categories
- has_many  :categories,  through:  :item_categories

## deliveriesテーブル(配送関係)
|Column|Type|Options|
|------|----|-------|
|area|string|null: false|
|price|integer|null: false|
|leadtime|integer|null: false|
### Association
- has_many :items

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

## imagesテーブル(商品画像)
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|items_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :item

