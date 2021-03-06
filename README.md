# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_kana          | string  | null: false               |
| first_kana         | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options                        |
| ----------------    | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| item_description    | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| delivery_id         | integer    | null: false                    | 
| location_id         | integer    | null: false                    |
| item_date_id        | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## addresses テーブル

| Column           | Type          | Options                        |
| ---------------- | ----------    | ------------------------------ |
| postal_code      | string        | null: false                    |
| location_id      | integer       | null: false                    |
| municipality     | string        | null: false                    |
| address          | string        | null: false                    |
| building_name    | string        |                                |
| phone_number     | string        | null: false                    |
| purchase         | references    | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## purchases テーブル

| Column          | Type        | Options                        |
| --------------  | ----------  | -----------                    |
| user            | references  | null: false, foreign_key: true |
| item            | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address