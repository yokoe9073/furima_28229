# テーブル設計

## users テーブル
| Column       | Type   | Options     |
| -------------| ------ | ----------- |
| first_name   | string | null: false |
| last_name    | string | null: false |
| furi_first_n | string | null: false |
| furi_last_n  | string | null: false |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
### Association
- has_many :items
- has_many :comments
- has_one :buyer



## items テーブル
| Column               | Type      | Options                       |
| ---------------------| ----------| ------------------------------|
| item_name            | string    | null: false                   |
| image                | string    | null: false                   |
| category             | integer   | null: false                   |
| details              | string    | null: false                   |
| price                | integer   | null: false                   | 
| status               | integer   | null: false                   |
| delivery_fee         | integer   | null: false                   |
| exhibitor_prefectures| integer   | null: false                   |
| shipping_date        | integer   | null: false                   |
| user                 | references| null: false, foreign_key: true|
### Association
- belongs_to :users
- has_many :comments
- has_one :buyer



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
| card_info        | string     | null: false                    |
### Association
- belongs_to :users
- belongs_to :items
- has_one :shipping



## shipping テーブル
| Column     | Type      | Options                        |
| -----------| ----------| -------------------------------|
| postal     | string    | null: false                    |
| prefectures| integer   | null: false                    |
| city       | string    | null: false                    |
| address    | string    | null: false                    | 
| building   | string    | null: false                    |
| tel        | integer   | null: false                    |
| buyer      | references| null: false, foreign_key: true |
### Association
- belongs_to :buyer