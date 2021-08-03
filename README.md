## usersテーブル

|Column             |Type   |Options     |
| ----------------- | ----- | ---------- |
|nickname           |string |null: false |
|email              |string |null: false |
|encrypted_password |string |null: false |
|last_name          |string |null: false |
|first_name         |string |null: false |
|birth_date         |integer|null: false |

### Association

- has_many :items
- has_many :purchase
- belongs_to :address

## itemsテーブル

|Column        |Type          |Options           |
| ------------ | ------------ | ---------------- |
|user          |references    |foreign_key: true |
|item_name     |string        |null: false       |
|description   |text          |null: false       |
|image         |ActiveStorage |                  |
|category      |integer       |null: false       |
|item_state    |integer       |null: false       |
|shipping_fee  |integer       |null: false       |
|shipping_from |integer       |null: false       |
|shipping_days |integer       |null: false       |
|price         |string        |null: false       |

### Association

- belongs_to :users
- belongs_to :purchase

## purchaseテーブル

|Column        |Type          |Options           |
| ------------ | ------------ | ---------------- |
|user          |references    |foreign_key: true |
|item　　　     |references    |foreign_key: true |

### Association

- has_many :items
- belongs_to :users
- belongs_to :address

## addressテーブル

|Column        |Type  |Options     |
| ------------ | ---- | ---------- |
|zip           |string|null: false |
|city          |string|null: false |
|address_line1 |string|null: false |
|address_line2 |string|null: false |
|telephone     |string|null: false |
|building      |string|null: false |

### Association

- belongs_to :purchase
- belongs_to :users