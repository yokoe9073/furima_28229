# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :buyer

## items テーブル

| Column               | Type      | Options                       |
| ---------------------| ----------| ------------------------------|
| item_name            | string    | null: false                   |
| image                | string    | null: false                   |
| category             | string    | null: false                   |
| price                | integer   | null: false                   | 
| status               | string    | null: false                   |
| delivery_fee         | integer   | null: false                   |
| exhibitor_prefectures| string    | null: false                   |
| shipping_date        | string    | null: false                   |
| user                 | references| null: false, foreign_key: true|

### Association

- belongs_to :users
- has_many :comments

## comments テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| comments-text | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## buyer テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | -------------------------------|
| user             | references | null: false, foreign_key: true |
| shopping_address | string     | null: false                    |
| card_info        | string     | null: false                    |

### Association

- belongs_to :users