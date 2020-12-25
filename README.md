＃ テーブル設計

## users テーブル

| Column             | Type   | Options      |
| --------           | ------ | ----------   |
| nike_name          | string | null: false  |
| email              | string |null: false, unique: true  |
| encrypted_password | string | null: false  |
| last_name          | string | null: false  |
| first_name         | string | null: false  |
| last_name_kana     | string | null: false  |
| first_name_kana    | string | null: false  |
| barth_day          | date   | null: false  |

### Association 

- has_many :orders
- has_many :items

## items テーブル

| Column              | Type    | Options     |
| --------            | ------  | ----------  |
| picture             | string  | null: false |
| product_name        | string  | null: false |   <!-- 商品名 -->
| product_description | text    | null: false |    <!-- 商品説明 -->
| category_id         | integer | null: false |
| condition_id        | integer | null: false |
| shipping_charge_id | integer | null: false |　　<!-- 配送料 -->
| prefecture_id      | integer | null: false |
| days_to_ship_id     | integer | null: false |
| price               | integer  | null: false |
| user | references | null: false, foreign_key: true |







### Association 

- has_one :oder
- belongs_to :user


## orders テーブル

| Column     | Type       | Options           |
| --------   | ---------- | ----------------- |
| item | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

### Association 

- belongs_to :user
- belongs_to :item
- has_one :Street address



## Street address テーブル

| Column            | Type       | Options           |
| --------          | ---------- | ----------------- |
| expiration_date_m | string     | null: false       |    <!-- 有効期限 -->
| expiration_date_y | string     | null: false       |    <!-- 有効期限 -->
| security_code     | string     | null: false       |    
| postal_code       | string     | null: false       |      <!-- 郵便番号 -->
| prefecture_id     | integer    | null: false       |     <!-- 都道府県 -->
| municipality      | string     | null: false       |     <!-- 市区町村 -->
| address           | string     | null: false       |   <!-- 番地 -->
| building_name     | string     |                   |     <!-- 建物名 -->
| phone_number      | string     | nill: false       |
| order             | references | null: false, foreign_key: true |
### Association 

- belongs_to :order
