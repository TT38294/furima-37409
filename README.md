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
- has_one :purchases_info


## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| describe        | text       | null: false                    |
| category_id     | integer    | null: false, foreign_key: true |
| status_id       | integer    | null: false, foreign_key: true |
| charge_id       | integer    | null: false, foreign_key: true |
| prefecture_id   | integer    | null: false, foreign_key: true | 
| date_id         | integer    | null: false, foreign_key: true |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchases_infos
- has_many :comments
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :charge
- belongs_to_active_hash :date


## purchases テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false, foreign_key: true |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | null: false                    |
| tel_number     | string     | null: false                    |
| purchase_info  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases_info
- belongs_to_active_hash :prefectures


## comments テーブル
| Column  | Type       | Options     |
| ------  | ---------- | ----------- |
| content | text       | null: false |
| user    | references | null: false |
| item    | references | null: false |


## purchases_info テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase