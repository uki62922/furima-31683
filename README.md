# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nick_name  | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| first_name | string  | null: false |
| last_name  | string  | null: false |
| year_bi    | integer | null: false |
| month_bi   | integer | null: false |
| day_bi     | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| image        |            |             |
| goods        | string     | null: false |
| item_text    | text       | null: false |
| category     | string     | null: false |
| condition    | string     | null: false |
| postage      | integer    | null: false |
| area         | string     | null: false |
| days_deliver | integer    | null: false |
| price        | integer    | null: false |
| user_id      | references |             |

### Association

- belongs_to :user
- has_one :oder



## orders テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| card       | integer    |             |
| exp_month  | integer    | null: false |
| exp_year   | integer    | null: false |
| cvv        | integer    | null: false |
| postal     | integer    | null: false |
| prefecture | string     | null: false |
| city       | string     | null: false |
| address    | string     | null: false |
| buil       | string     |             |
| tel        | integer    | null: false |
| user_id    | references |             |
| item_id    | references |             |

### Association

- belongs_to :user
- belongs_to :item

