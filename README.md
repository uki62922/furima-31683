# アプリケーション名
 Furima
# アプリケーション概要
テックキャンプの最終課題にて作成したアプリケーションです。
# URL
https://furima-31683.herokuapp.com/
# Githubリポジトリ
https://github.com/uki62922/furima-31683
# ベーシック認証
- ID: admin
- Pass: 2222
# テスト用アカウント
### 購入者用アカウント
- メールアドレス: buy@test
- パスワード: 123aaa
### 購入者用カード情報
- 番号: 4242424242424242 
- 期限: 12/21
- セキュリティコード: 123
### 出品者用アカウント
- メールアドレス: sell@test
- パスワード:123aaa
# 利用方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。

ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、上記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。
- 出品方法

テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
- 購入方法

テストアカウントでログイン→トップページから商品検索→商品選択→商品購入
- 確認後、ログアウト処理をお願いします。

# 開発環境
Ruby / Ruby on Rails / MySQL / GitHub / Heroku / AWS / Visual Studio Code / Trello
# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nick_name          | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birth              | date    | null: false |

### Association
 
- has_many :items
- has_many :orders
- has_many :comment

## items テーブル

| Column          | Type       | Options           |
| ------------    | ---------- | ----------------- |
| goods           | string     | null: false       |
| item_text       | text       | null: false       |
| category_id     | integer    | null: false       |
| condition_id    | integer    | null: false       |
| postage_id      | integer    | null: false       |
| area_id         | integer    | null: false       |
| days_deliver_id | integer    | null: false       |
| price           | integer    | null: false       |
| user            | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :comment



## orders テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## address テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal        | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| buil          | string     |                   |
| tel           | string     | null: false       |
| order         | references | foreign_key: true |


### Association

- belongs_to :order

## comments テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user