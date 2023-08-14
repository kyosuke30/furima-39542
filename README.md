# テーブル設計

## users テーブル

| Column             | Type   | Options             |
| ------------------ | ------ | ------------------- |
| nickname           | string | null: false         |
| email              | string | null: false, unique |
| password           | string | null: false         |
| last_name          | string | null: false         |
| fist_name          | string | null: false         |
| last_name_kana     | string | null: false         |
| fist_name_kana     | string | null: false         |

### Association
- has_many :item
- has_many :buys

##  items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| name                | string     | null: false                    |
| text                | text       | null: false                    |
| category            | string     | null: false                    |
| sales_status        | string     | null: false                    |
| shipping_fee_status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled_delivery  | string     | null: false                    |
| prise               | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- has_many :user

##  orders テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| addresses    | string     | null: false |
| building     | string     | null: false |
| phone_number | string     | null: false |

##  buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user