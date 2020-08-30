# フリマ DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|family_name|string|null: false|
|first_name|stirng|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
  - has_many :items
  - has_many :buys
  - has_one  :address
  - has_many :comments#, dependent: :destroy
  - has_one  :profile
  - has_many :likes, dependent: :destroy
  - has_many :liked_items, through: :likes, source: :item
  - has_many :sns_credentials
  - has_many :relationships
  - has_many :followings, through: :relationships, source: :follow
  - has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follow_id"
  - has_many :followers, through: :reverse_of_relationships, source: :user

## addressesテーブル(住所)
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|stirng|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|zipcode|integer|null: false|
|area|string|null: false|
|city|string|null: false|
|street|text|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
  - belongs_to :user, optional: true

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user_id|string||

### Association
  - belongs_to :user, optional: true

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|string||
|user_id|references|null: false, foreign_key: true|

### Association
  - belongs_to :user

## itemsテーブル(商品)
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|price|integer|null: false|
|text|text|null: false|
|stock|integer|null: false|
|brand|string||
|condition|string|null: false|
|shipping|string|null: false|
|leadtime|string|null: false|
|reservation_email|string||
|user_id|references|null: false, foreign_key: true|
|delivery_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
  - belongs_to :user
  - belongs_to :delivery
  - belongs_to :category
  - has_many   :buys
  - has_many   :comments
  - has_many   :images
  - has_many   :likes
  - has_many   :liked_users, through: :likes, source: :user
  - accepts_nested_attributes_for :images, allow_destroy: true

## imagesテーブル(商品画像)
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
  - belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
  - has_many :items
  - has_ancestry

## deliveriesテーブル(配送関係)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|size|string|null: false|
|price|integer|null: false|

### Association
  - has_many :items

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
  - belongs_to :item
  - belongs_to :user


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
  - belongs_to :item
  - belongs_to :user

## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|follow_id|references|null: false, foreign_key: { to_table: :users }|

### Association
  - belongs_to :user
  - belongs_to :follow, class_name: "User"

## buysテーブル(購入)
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|price|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
  - belongs_to :item
  - belongs_to :user

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
