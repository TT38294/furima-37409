# テーブル設計
 
## users テーブル

| Column                     | Type    | Options                   |
| -------------------------- | ------- | ------------------------- |
| nickname                   | string  | null: false               |
| email                      | string  | null: false, unique: true |
| encrypted_password         | string  | null: false               |
| family_name                | string  | null: false               |
| first_name                 | string  | null: false               |
| family_name_kana           | string  | null: false               |
| first_name_kana            | string  | null: false               |
| birth_day                  | date    | null: false               |

### Association
- has_many :items
- has_many :comments
- belongs_to :purchase


## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| describe        | text       | null: false                    |
| category_id     | string     | null: false                    |
| status_id       | string     | null: false                    |
| charge_id       | string     | null: false                    |
| prefectures_id  | string     | null: false                    |
| date_id         | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase
- has_many :comments
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :charge
- belongs_to_active_hash :date


## purchases テーブル
| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| post_code      | string     | null: false |
| prefectures_id | string     | null: false |
| municipalities | string     | null: false |
| address        | string     | null: false |
| building_name  | string     | null: false |
| tel_number     | string     | null: false |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to_active_hash :prefectures


## comments テーブル
| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## purchases_info テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| purchase | references | null: false, foreign_key: true |