# テーブル設計

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| details           | text       | null: false                    |
| price             | integer     | null: false                    |
| category_id          | string     | null: false                    |
| condition_id          | string     | null: false                    |
| shipping_charge_id     | string     | null: false                    |
| prefecture_id          | string     | null: false                    |
| ship_date_id           | string     | null: false                    |
| user                   | references     | null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_many :comments
- has_one :purchase


## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| nickname               | string | null: false                |
| first_name_kanji       | string   | null: false                |
| family_name_kanji      | string   | null: false                |
| first_name_kana        | string   | null: false                |
| family_name_kana       | string   | null: false                |
| birthday               | date     | null: false                |

### Association

- has_many :items
- has_many :comments
- has_many :purchases


## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item     | reference  | null: false, foreign_key: true   |
| user     | reference  | null: false, foreign_key: true   |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination


## destinations テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post           | string       | null: false                    |
| prefecture_id  | string      | null: false                      |
| city           | string       | null: false                     |
| address_1      | string     | null: false                    |
| address_2      | string     |                                 |
| phone_number   | string     | null: false                    |
| purchase       | references     | null: false, foreign_key: true  |

### Association

- belongs_to :purchase




## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| comment    | text       | null: false                    |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user