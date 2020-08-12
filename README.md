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
| birthday     | date   | null: false |
### Association
- has_many :items
- has_many :comments
- has_many :buyer



## items テーブル
| Column               | Type      | Options                       |
| ---------------------| ----------| ------------------------------|
| name                 | string    | null: false                   |
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
- belongs_to :user
- has_many :comments
- has_one :buyer



## comments テーブル
| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| comments-text | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item



## buyer テーブル
| Column           | Type       | Options                        |
| -----------------| ---------- | -------------------------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping



## shipping テーブル
| Column     | Type      | Options                        |
| -----------| ----------| -------------------------------|
| postal     | string    | null: false                    |
| prefectures| integer   | null: false                    |
| city       | string    |                                |
| address    | string    | null: false                    | 
| building   | string    | null: false                    |
| tel        | string    | null: false                    |
| buyer      | references| null: false, foreign_key: true |
### Association
- belongs_to :buyer