＃ テーブル設計

## users テーブル

| Column             | Type   | Options      |
| --------           | ------ | ----------   |
| nike_name          | string | nill: false  |
| email              | string | unique: true |
| encrypted_password | string | nill: false  |
| last_name          | string | nill: false  |
| first_name         | string | nill: false  |
| last_name_kana     | string | nill: false  |
| first_name_kana    | string | nill: false  |
| barth day          | date   | nill: false  |

### Association 

- has_many :oders
- has_many :items

## items テーブル

| Column              | Type    | Options     |
| --------            | ------  | ----------  |
| picture             | string  | nill: false |
| product_name        | string  | nill: false |   <!-- 商品名 -->
| product_description | string  | nill: false |    <!-- 商品説明 -->
| category_id         | integer | nill: false |
| condition_id        | integer | nill: false |
| shipping_charges_id | integer | nill: false |　　<!-- 配送料 -->
| shipping_area_id    | integer | nill: false |
| days_to_ship_id     | integer | nill: false |
| price               | string  | nill: false |





### Association 

- has_one :oder
- belongs_to :user


## oders テーブル

| Column     | Type       | Options           |
| --------   | ---------- | ----------------- |
| item       | text       | nill: false       |
| name       | references | foreign_key: true |


### Association 

- belongs_to :user
- belongs_to :item


## Street address テーブル

| Column            | Type       | Options           |
| --------          | ---------- | ----------------- |
| card_information  | string     | nill: false       |
| expiration_date_m | string     | nill: false       |    <!-- 有効期限 -->
| expiration_date_y | string     | nill: false       |    <!-- 有効期限 -->
| security_code     | string     | nill: false       |    
| postal_code       | string     | nill: false       |      <!-- 郵便番号 -->
| prefectures       | integer    | nill: false       |     <!-- 都道府県 -->
| municipality      | string     | nill: false       |     <!-- 市区町村 -->
| address           | string     | nill: false       |   <!-- 番地 -->
| Building_name     | string     | nill: false       |     <!-- 建物名 -->
| phone_number      | string     | nill: false       |
### Association 

- belongs_one :oder
