## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_one :shipping_info

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | text       | null: false                    |
| info                | text       | null: false                    |
| category            | string     | null: false                    |
| sales_status        | string     | null: false                    |
| shipping_fee_status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled_delivery  | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shipping_info

## shipping_infos テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| shipping_prefecture | string     | null: false                    |
| city                | text       | null: false                    |
| addresses           | text       | null: false                    |
| building            | text       | null: false                    |
| phone_number        | string     | null: false                    |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item