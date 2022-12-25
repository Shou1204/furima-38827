# テーブル設計

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| image            | string       | null: false                    |
| details           | text       | null: false                    |
| price             | integer     | null: false                    |
| category          | string     | null: false                    |
| condition          | string     | null: false                    |
| shipping_charge      | string     | null: false                    |
| ship_from          | string     | null: false                    |
| ship_date           | string     | null: false, foreign_key: true    |
| user_id            | references     | null: false, foreign_key: true  |


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
| birthday               | integer  | null: false                |

### Association

- has_many :items
- has_many :comments
- has_many :purchases


## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| purchase    | string     | null: false                    |
| user_id     | reference  | null: false                    |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination


## destinations テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post       | string       | null: false                    |
| prefecture  | string      | null: false                      |
| city        | string       | null: false                     |
| address_1      | string     | null: false                    |
| address_2      | string     |                                 |
| phone_number   | integer     | null: false                    |

### Association

- belongs_to :purchase




## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| comment    | text       | null: false                    |
| item_id     | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user