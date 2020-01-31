#README

#DB設計!!

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :comments, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :likes
- has_many :snss
- has_many :tradings
- has_one :creditcard
- has_one :profile

## Profilesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|first_name|string|null: false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
|phone_number|integer|unique: true|
|user_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to: user

## adressesテーブル
|Column|Type|Options|
|------|----|-------|
|zipcode|integer|null:false|
|prefecture|integer|null:false|
|city|string|null:false|
|district|string|null:false|
|building|string|null:false|
|user_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to: user

## snssテーブル
|Column|Type|Options|
|------|----|-------|
|token|text|null: false|
|uid|string|null: false, unique: true|
|provider|string|null: false|
|user_id|reference|null: false, index: true, foreign_key: true|
### Association
- belongs_to: user

## Creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|year|integer|null: false|
|month|integer|null: false|
|security_code|integer|null: false|
|card_code|integer|null: false|
|user_id|reference|null: false, index: true, foreign_key: true|
### Association
- belongs_to: user

## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|user_id|reference|null: false, index: true, foreign_key: true|
|product_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, index: true, foreign_key: true|
|product_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user

## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, index: true, foreign_key: true|
|size_id|reference|null:false,index: true, foreign_key: true|
|description|text|null: false|
|brand_id|reference|index: true, foreign_key: true|
|price|integer|null: false|
|shipping_id|reference|null: false, index: true, foreign_key: true|
|state_id|integer|null: false|
|condition_id|integer|null: false|
|name|string|null: false, index: true|
|image_id|reference|null: false, index: true|
|price|string|null: false, index: true|
|category_id|reference|null: false, index: true, foreign_key: true|

### Association

- has_many :images, dependent: :delete_all
- has_many :comments
- belongs_to :shipping, dependent: :delete
- belongs_to :size
- belongs_to :condition
- belongs_to :state
- belongs_to :category
- belongs_to :user
- belongs_to :brand
- has_one :order
- has_many :likes

## Tradingsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|reference|null: false, index: true, foreign_key: true|
|buyer_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to :buyer, class_name: “User”
- belongs_to :seller, class_name: “User”
- has_one :order, dependent: :destroy


## Ordersテーブル
|Column|Type|Options|
|------|----|-------|
|status|integer|null: false|
|product_id|reference|null: false, index: true, foreign_key: true|
|trading_id|reference|null: false, index: true, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :trading

## Shippingsテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_method|sting|null: false|
|region|string|null: false|
|period_before_shipping|string|null: false|
|fee|integer|null: false|

### Association
- has_one :product

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|number|integer|null: false, unique: true|
|number_path|integer|null: false, unique: true|

### Association
has_many :products

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_one :products

## Sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many :products

## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|reference|null: false, index: true, foreign_key: true|

### Association
belongs_to :product ,optional: true

## Conditions
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

## States
|Column|Type|Options|
|------|----|-------|
|sell_state|integer|null: false|

### Association

has_one :product