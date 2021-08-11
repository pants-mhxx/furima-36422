## usersテーブル

|Column             |Type   |Options                  |
| ----------------- | ----- | ----------------------- |
|nickname           |string |null: false              |
|email              |string |null: false, unique: true|
|encrypted_password |string |null: false              |
|last_name          |string |null: false              |
|first_name         |string |null: false              |
|first_furigana     |string |null: false              |
|last_furigana      |string |null: false              |
|birth_date         |date   |null: false              |


### Association

- has_many :items
- has_many :purchases

## itemsテーブル

|Column           |Type       |Options           |
| --------------- | --------- | ---------------- |
|user             |references |foreign_key: true |
|name             |string     |null: false       |
|description      |text       |null: false       |
|category_id      |integer    |null: false       |
|item_state_id    |integer    |null: false       |
|shipping_fee_id  |integer    |null: false       |
|shipping_from_id |integer    |null: false       |
|shipping_day_id  |integer    |null: false       |
|price            |integer    |null: false       |

### Association

- belongs_to :user
- has_one :purchase

## purchaseテーブル

|Column        |Type          |Options           |
| ------------ | ------------ | ---------------- |
|user          |references    |foreign_key: true |
|item          |references    |foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addressテーブル

|Column           |Type      |Options          |
| --------------- | -------- | --------------- |
|zip              |string    |null: false      |
|shipping_from_id |integer   |null: false      |
|address_line1    |string    |null: false      |
|address_line2    |string    |null: false      |
|telephone        |string    |null: false      |
|building         |string    |                 |
|purchase         |references|foreign_key: true|

### Association

- belongs_to :purchase