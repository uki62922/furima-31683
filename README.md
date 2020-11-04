# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nick_name          | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| year_bi            | date    | null: false |
| month_bi           | date    | null: false |
| day_bi             | date    | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| goods        | string     | null: false       |
| item_text    | text       | null: false       |
| category     | integer    | null: false       |
| condition    | integer    | null: false       |
| postage      | integer    | null: false       |
| area         | integer    | null: false       |
| days_deliver | integer    | null: false       |
| price        | integer    | null: false       |
| user_id      | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :oder



## orders テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| postal     | string     | null: false       |
| prefecture | integer    | null: false       |
| city       | string     | null: false       |
| address    | string     | null: false       |
| buil       | string     |                   |
| tel        | string     | null: false       |
| user_id    | references | foreign_key: true |
| item_id    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

