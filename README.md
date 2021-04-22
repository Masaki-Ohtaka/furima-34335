# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------  | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_kana      | string  | null: false |
| last_kana       | string  | null: false |
| birthday_year   | integer | null: false | 
| birthday_month  | integer | null: false |
| birthday        | integer | null: false |

### Association

- has_many :items
- has_many :addresses
- has_many :purchases

## items テーブル

| Column              | Type       | Options                        |
| ----------------    | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| item                | string     | null: false                    |
| category            | string     | null: false                    |
| item_state          | string     | null: false                    |
| item_description    | string     | null: false                    |
| category            | integer    | null: false                    |
| item_condition      | integer    | null: false                    |
| shipping_changes    | integer    | null: false                    | 
| shipping_area       | integer    | null: false                    |
| days_to_ship        | integer    | null: false                    |
| price               | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address
- has_one :purchase

## addresses テーブル

| Column           | Type          | Options                        |
| -------------    | ----------    | ------------------------------ |
| postal_code      | string        | null: false                    |
| prefectures      | string        | null: false                    |
| municipality     | string        | null: false                    |
| address          | string        | null: false                    |
| building_name    | string        |                                |
| phone_number     | integer       | null: false                    |
| user_id          | references    | null: false, foreign_key: true |
| item_id          | references    | null: false, foreign_key: true | 
| purchase_id      | references    | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :address
- belongs_to :purchase

## purchases テーブル

| Column          | Type    | Options                        |
| --------------  | ------- | -----------                    |
| user_id         | string  | null: false, foreign_key: true |
| item_id         | string  | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address