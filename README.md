＃ テーブル設計

## users テーブル

| Column          | Type   | Options   |
| --------        | ------ | ----------|
| email           | string | nill: false |
| password        | string | nill: false |
| last_name       | string | nill: false |
| first_name      | string | nill: false |
| last_name_kana  | string | nill: false |
| first_name_kana | string | nill: false |
| barth day       | date   | nill: false |

### Association 

- has_many :recode
- has_many :items

## items テーブル

| Column              | Type    | Options     |
| --------            | ------  | ----------  |
| picture             | string  | nill: false |
| product name        | string  | nill: false |   <!-- 商品名 -->
| product description | string  | nill: false |    <!-- 商品説明 -->
| category_id         | integer | nill: false |
| condition_id        | integer | nill: false |
| shipping charges_id | integer | nill: false |　　<!-- 配送料 -->
| shipping area_id    | integer | nill: false |
| days to ship_id     | integer | nill: false |
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

| Column          | Type       | Options           |
| --------        | ---------- | ----------------- |
| Postal code     | string     | nill: false       |
| Prefectures_id  | integer    | nill: false       |
| Municipality_id | integer    | nill: false       |

### Association 

- belongs_one :oder
